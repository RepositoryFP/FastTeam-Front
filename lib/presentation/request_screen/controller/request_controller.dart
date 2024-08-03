import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/book_a_wash_screen/models/book_a_wash_model.dart';
import 'package:fastteam_app/presentation/request_screen/models/request_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class RequestController extends GetxController {
  Rx<RequestModel> bookAWashModelObj = RequestModel().obs;
  String serchingText = "";
  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSerching(String value) {
    serchingText = value;
    update();
  }

  insertAbsentSubmission(Map<String, dynamic> bodyParams, var token) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };

    var response = await http
        .post(
          Uri.parse("${BaseServer.serverUrl}/user-pengajuanAbsensi/"),
          headers: headers,
          body: bodyParams,
        )
        .timeout(BaseServer.durationlimit);

    return response;
  }

  insertLeaveSubmission(
      Map<String, dynamic> bodyParams, file, var token) async {
    var response = http.MultipartRequest(
      'POST',
      Uri.parse("${BaseServer.serverUrl}/cuti/"),
    );

    response.headers['Content-Type'] = 'application/json';
    response.headers['Authorization'] = 'Bearer $token';
    response.fields['user'] = bodyParams['userId'];
    response.fields['cuti_id'] = bodyParams['cuti_id'];
    response.fields['tanggal'] = bodyParams['tanggal'];
    response.fields['time'] = bodyParams['time'];
    response.fields['note'] = bodyParams['note'];

    if (file != null) {
      final multipartFile = http.MultipartFile(
        'bukti',
        file!.readAsBytes().asStream(),
        file!.lengthSync(),
        filename: 'image.jpg', // Nama file yang sesuai
        contentType: MediaType(
            'image', 'jpeg'), // Sesuaikan dengan jenis gambar yang diunggah
      );
      response.files.add(multipartFile);
    }

    return response.send();
  }

  insertOvertimeSubmission(Map<String, dynamic> bodyParams, var token) async {
    Map<String, String> headers = {
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .post(
          Uri.parse("${BaseServer.serverUrl}/lembur/"),
          headers: headers,
          body: bodyParams,
        )
        .timeout(BaseServer.durationlimit);

    return response;
  }

  submitAbsent(context, date, time, type, url) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userEmployeeId = prefs.getInt('user-id_user');

      Map<String, dynamic> requestBody = {
        'user_id': userEmployeeId.toString(),
        'tgl': date.toString(),
        'jam': time.toString(),
        'jenis': type,
        'bukti': url,
      };

      var token = prefs.getString('token');

      var result = await insertAbsentSubmission(requestBody, token);

      if (result is http.Response) {
        var jsonResponse = Constants().jsonResponse(result);

        if (jsonResponse != null && jsonResponse is Map<String, dynamic>) {
          return jsonResponse;
        } else {
          showSnackBar(context, 'Response format is invalid');
          return null;
        }
      } else {
        showSnackBar(context, 'Failed to submit Leave: ${result.toString()}');
        return null;
      }
    } catch (e) {
      showSnackBar(context, 'Server having trouble');
      return null;
    }
  }

  submitOvertime(context, date, start_time, end_time, reason) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userEmployeeId = prefs.getInt('user-id_user');

      Map<String, dynamic> requestBody = {
        'user': userEmployeeId.toString(),
        'tanggal': date,
        'jam_mulai': start_time,
        'jam_selesai': end_time,
        'alasan': reason,
      };

      var token = prefs.getString('token');

      var result = await insertOvertimeSubmission(requestBody, token);

      if (result is http.Response) {
        var jsonResponse = Constants().jsonResponse(result);

        if (jsonResponse != null && jsonResponse is Map<String, dynamic>) {
          return jsonResponse;
        } else {
          showSnackBar(context, 'Response format is invalid');
          return null;
        }
      } else {
        showSnackBar(context, 'Failed to submit Leave: ${result.toString()}');
        return null;
      }
    } catch (e) {
      showSnackBar(context, 'Server having trouble');
      return null;
    }
  }

  submitLeave(BuildContext context, date, time, type, reason, img) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var userEmployeeId = prefs.getInt('user-id_user');

      Map<String, dynamic> requestBody = {
        'userId': userEmployeeId.toString(),
        'tanggal': date,
        'time': time,
        'note': reason,
        'cuti_id': type,
      };
      var token = prefs.getString('token');

      var result = await insertLeaveSubmission(requestBody, img, token);
      
      if (result.statusCode == 200) {
        return result.statusCode;
      } else {
        showSnackBar(context, 'Failed to submit Leave: ${result.toString()}');
        return null;
      }
    } catch (e) {
      showSnackBar(context, 'Server having trouble');
      return null;
    }
  }

  showSnackBar(context, message) {
    snackbar() => SnackBar(
          content: Text(
            message,
            style: const TextStyle(
              fontSize: 12.0,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
          duration: const Duration(milliseconds: 2000),
        );
    ScaffoldMessenger.of(context).showSnackBar(snackbar());
  }
}
