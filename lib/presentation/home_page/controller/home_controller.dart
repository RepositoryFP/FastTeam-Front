import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/home_page/models/account_model.dart';
import 'package:fastteam_app/presentation/home_page/models/home_model.dart';
import 'package:fastteam_app/presentation/home_page/models/list_employee_absent_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/standalone.dart' as tz;

class HomeController extends GetxController {
  HomeController(this.homeModelObj);

  Rx<HomeModel> homeModelObj;

  Rx<int> silderIndex = 0.obs;
  var isLoading = false.obs;
  var isDataLoaded = false.obs;
  AccountInformationModel? accountInfo;

  DateTime? masukAwalDateTime;
  DateTime? masukAkhirDateTime;
  DateTime? keluarAwalDateTime;
  DateTime? keluarAkhirDateTime;

  String currentDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

  var accountModel = AccountInformationData();
  var responseModel = EmployeeAbsentResponse(
      status: '0', details: EmployeeAbsentDetails(data: [])).obs;

  var filteredEmployees = <EmployeeAbsent>[].obs;
  var memberEmployees = <EmployeeAbsent>[].obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAccountInformation() async {
    
    if (isDataLoaded.value) return;

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      var userEmployeeId = prefs.getInt('user-employee_id');
      if (userEmployeeId == null) {
        return;
      }
      isLoading.value = true;

      var result = await retrieveEmployeeInfo(userEmployeeId);
      var data = Constants().jsonResponse(result);

      if (data['status'] == 200) {
        var accountDetails = data['details'];
        if (accountDetails is Map<String, dynamic>) {
          var accountData = accountDetails['data'] as Map<String, dynamic>;

          AccountInformationModel accountDataModel =
              AccountInformationModel.fromJson(accountData);

          List<AccountInformationModel> accountDatas = [accountDataModel];

          accountModel.updateBranchItems(accountDatas);
          accountInfo = accountModel.accountInformation.isNotEmpty
              ? accountModel.accountInformation[0]
              : null;

          // Only call memberData if account information is available
          if (accountInfo != null) {
            memberData(currentDate, accountInfo!.id_divisi);
          }

          // Set isDataLoaded to true after successfully fetching the data
          isDataLoaded.value = true;
        } else {
          print('Details is not a map.');
          throw Exception('Failed to load branch data');
        }
      } else {
        print('Failed to fetch data: ${data['status']}');
        throw Exception('Failed to load branch data');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load branch data');
    } finally {
      isLoading.value = false;
    }
  }

  bool canAbsent(clockIn) {
    tz.initializeTimeZones();
    final indonesia = tz.getLocation("Asia/Jakarta");
    var now = tz.TZDateTime.now(indonesia);
    if (accountInfo?.masukAwal != '') {
      masukAwalDateTime = tz.TZDateTime.parse(
          indonesia, "${currentDate} ${accountInfo?.masukAwal}");
    }

    if (accountInfo?.masukAkhir != '') {
      masukAkhirDateTime = tz.TZDateTime.parse(
          indonesia, "${currentDate} ${accountInfo?.masukAkhir}");
    }

    if (accountInfo?.keluarAwal != '') {
      keluarAwalDateTime = tz.TZDateTime.parse(
          indonesia, "${currentDate} ${accountInfo?.keluarAwal}");
    }

    if (accountInfo?.keluarAkhir != '') {
      keluarAkhirDateTime = tz.TZDateTime.parse(
          indonesia, "${currentDate} ${accountInfo?.keluarAkhir}");
    }
    var result;
    if (clockIn) {
      result = masukAwalDateTime != null &&
          masukAkhirDateTime != null &&
          now.isAfter(masukAwalDateTime!) &&
          now.isBefore(masukAkhirDateTime!);
    } else {
      result = keluarAwalDateTime != null &&
          keluarAkhirDateTime != null &&
          now.isAfter(keluarAwalDateTime!) &&
          now.isBefore(keluarAkhirDateTime!);
    }

    return result;
  }

  retrieveEmployeeInfo(userId) async {
    try {
      var response = await http
          .get(Uri.parse("${BaseServer.serverUrl}/personal-info/$userId/"))
          .timeout(BaseServer.durationlimit);
      return response;
    } catch (e) {
      return {
        "status": 500,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut."
      };
    }
  }

  Future<http.Response> retrieveUserAbsenDateDivisi(
      String? token, String tanggal, int idDivisi) async {
    var path = '${BaseServer.serverUrl}/user-absen/${tanggal}/${idDivisi}/';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse(path), headers: headers)
        .timeout(BaseServer.durationlimit);
    return response;
  }

  Future<http.Response> retrieveUserAbsenOnly(String? token) async {
    var path = '${BaseServer.serverUrl}/user-absen/';
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse(path), headers: headers)
        .timeout(BaseServer.durationlimit);
    return response;
  }

  void getListBelumAbsen(String tanggal, int idDivisi) async {
    // Early return if data is already loaded
    if (isDataLoaded.value) return;
    print(idDivisi);
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      isLoading.value = true;

      http.Response response;
      if (idDivisi > 0) {
        response = await retrieveUserAbsenDateDivisi(token, tanggal, idDivisi);
      } else {
        response = await retrieveUserAbsenOnly(token);
      }

      // Check the status code of the response
      if (response.statusCode == 200) {
        // Parse JSON from the response body
        var result = jsonDecode(response.body);
        if (result['status'] == 'success') {
          responseModel.value = EmployeeAbsentResponse.fromJson(result);
          filteredEmployees.value = responseModel.value.details.data;

          // Set isDataLoaded to true after successfully fetching the data
          isDataLoaded.value = true; // Add this line
        } else {
          // Handle error response
          print('Error: ${result['details']}');
        }
      } else {
        // Handle non-200 status code
        print('Error: Server returned status code ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load employee data');
    } finally {
      isLoading.value = false;
    }
  }

  memberData(String tanggal, int? idDivisi) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      isLoading.value = true;

      http.Response response;

      response = await retrieveUserAbsenDateDivisi(token, tanggal, idDivisi!);

      if (response.statusCode == 200) {
        // Parse JSON dari response body
        var result = jsonDecode(response.body);
        if (result['status'] == 'success') {
          responseModel.value = EmployeeAbsentResponse.fromJson(result);
          memberEmployees.value = responseModel.value.details.data;
        } else {
          // Handle error response
          print('Error: ${result['details']}');
        }
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load employee data');
    } finally {
      isLoading.value = false;
    }
  }
}
