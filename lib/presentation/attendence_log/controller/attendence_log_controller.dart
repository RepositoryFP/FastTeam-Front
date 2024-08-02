import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AttendenceLogController extends GetxController {
  List<Map<String, dynamic>> dataAbsent = [];
  int absenCount = 0;
  int lateClockInCount = 0;
  int earlyClockOutCount = 0;
  int noClockInCount = 0;
  int noClockOutCount = 0;

  var isLoading = false.obs;
  var isDataLoaded = false.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  retriveAbsentData(token, userId, date) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var path = "${BaseServer.serverUrl}/log-absen/$userId/$date/";

    var response = await http
        .get(Uri.parse(path), headers: headers)
        .timeout(BaseServer.durationlimit);

    return response;
  }

  getAbsentData(selectedDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt('user-id_user');
    var token = prefs.getString('token');
    var date =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}";
    var absentData = await retriveAbsentData(token, userId, date);
    var result = Constants().jsonResponse(absentData);

    if (result['status'] == 200) {
      final List<dynamic> jsonData = result['details'];
      return jsonData.map((data) {
        List<dynamic> clock_in = data['clock_in'];
        List<dynamic> clock_out = data['clock_out'];

        clock_in.asMap().forEach((index, item) {
          DateTime? dateTimeMasuk;
          final String rawTimeMasuk = item['jam_absen'];
          if (RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$')
                  .hasMatch(rawTimeMasuk) ||
              RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\Z$')
                  .hasMatch(rawTimeMasuk)) {
            dateTimeMasuk = DateTime.parse(rawTimeMasuk).toLocal();
          }

          final String jamMasuk = dateTimeMasuk != null
              ? DateFormat.Hm().format(dateTimeMasuk)
              : '--:--';
          clock_in[index]['jam_absen'] = jamMasuk;
        });

        clock_out.asMap().forEach((index, item) {
          DateTime? dateTimeKeluar;
          final String rawTimeKeluar = item['jam_absen'];

          if (RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$')
                  .hasMatch(rawTimeKeluar) ||
              RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\Z$')
                  .hasMatch(rawTimeKeluar)) {
            dateTimeKeluar = DateTime.parse(rawTimeKeluar).toLocal();
          }
          final String jamKeluar = dateTimeKeluar != null
              ? DateFormat.Hm().format(dateTimeKeluar)
              : '--:--';
          clock_out[index]['jam_absen'] = jamKeluar;
        });
        // print(clock_out);

        // final String rawTimeKeluar = data['clock_out'][0]['jam_absen'];
        // DateTime? dateTimeKeluar;

        // if (rawTimeKeluar != null &&
        //     RegExp(r'^\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}\.\d{3}Z$')
        //         .hasMatch(rawTimeKeluar)) {
        //   dateTimeKeluar = DateTime.parse(rawTimeKeluar).toLocal();
        // }

        // final String jamKeluar = dateTimeKeluar != null
        //     ? DateFormat.Hm().format(dateTimeKeluar)
        //     : '--:--';

        final DateTime tanggal = DateTime.parse(data['tanggal']);
        final String dateText =
            '${tanggal.day} ${DateFormat.MMM().format(tanggal)}';

        return {
          'dateText': dateText,
          'dateColor': tanggal.weekday == DateTime.sunday
              ? ColorConstant.red
              : ColorConstant.black900,
          'id_masuk': data['clock_in'][0]['id_absen'],
          'id_keluar': data['clock_out'][0]['id_absen'],
          'jamMasuk': clock_in,
          'jamKeluar': clock_out,
          'isSunday': tanggal.weekday == DateTime.sunday,
        };
      }).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  retriveTotalData(token, userId, date) async {
    var path = "${BaseServer.serverUrl}/log-absen/detail-total/$userId/$date/";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse(path), headers: headers)
        .timeout(BaseServer.durationlimit);

    return response;
  }

  getTotalData(selectedDate) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var userId = prefs.getInt('user-id_user');
    var token = prefs.getString('token');

    var date =
        "${selectedDate.year}-${selectedDate.month.toString().padLeft(2, '0')}";

    var totalData = await retriveTotalData(token, userId, date);
    return Constants().jsonResponse(totalData);
  }

  Future<void> loadDataForSelectedMonth(DateTime _selectedDate) async {
    print(isDataLoaded.value);
    if (isDataLoaded.value) return;

    try {
      isLoading.value = true;

      final data = await getAbsentData(_selectedDate);
      final totalData = await getTotalData(_selectedDate);
      prettyPrintJson(data);
      dataAbsent = data;

      absenCount = totalData['details']['absen'];
      lateClockInCount = totalData['details']['late_clock_in'];
      earlyClockOutCount = totalData['details']['early_clock_out'];
      noClockInCount = totalData['details']['no_clock_in'];
      noClockOutCount = totalData['details']['no_clock_out'];

      isDataLoaded.value = true;
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load employee data');
    } finally {
      isLoading.value = false;
    }
  }

  void prettyPrintJson(List<Map<String, dynamic>> jsonList) {
    const JsonEncoder encoder = JsonEncoder.withIndent('  ');
    String prettyJson = encoder.convert(jsonList);
    print(prettyJson);
  }
}
