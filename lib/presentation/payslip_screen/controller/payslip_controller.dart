import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class PayslipController extends GetxController {
  var id_payroll;
  var basic_salary = 0.0;
  var net_salary = 0.0;
  var deduction = 0.0;
  var allowance = 0.0;
  var detail_payroll = [];
  bool emptyData = true;

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

  requestPayroll(token, userId, date) async {
    var path = "${BaseServer.serverUrl}/header-slip-gaji/";
    var id = userId;
    Map<String, dynamic> bodyParams = {
      "employee_id": '$id',
      "periode": '${date}'
    };
    var body = json.encode(bodyParams);
    var response = await http.post(
      Uri.parse(path),
      body: body,
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    return response;
  }

  requestDetailPayroll(token, payroll_id) async {
    var path = "${BaseServer.serverUrl}/detail-slip-gaji/";
    Map<String, dynamic> bodyParams = {
      "payroll_id": '${payroll_id}',
    };
    var body = json.encode(bodyParams);
    var response = await http.post(
      Uri.parse(path),
      body: body,
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    return response;
  }

  retrivePayroll(date) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userEmployeeId = prefs.getInt('user-employee_id');
    var token = prefs.getString('token');
    var result = await requestPayroll(token, userEmployeeId, date);

    return Constants().jsonResponse(result);
  }

  retriveDetailPayroll(payrollId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var result = await requestDetailPayroll(token, payrollId);

    return Constants().jsonResponse(result);
  }

  Future<void> payrolData(_selectedDate) async {
    try {
      if (isDataLoaded.value) return;
      isLoading.value = true;

      String formattedDate = formatDate(_selectedDate);

      var salaryResult = await retrivePayroll(formattedDate);

      if (salaryResult['status'] == 200) {
        var salaryDetail =
            await retriveDetailPayroll(salaryResult['details']['id']);

        id_payroll.value = salaryResult['details']['id'];
        basic_salary = salaryResult['details']['basic_salary'].toDouble();
        net_salary = salaryResult['details']['take_home_pay'].toDouble();
        detail_payroll = salaryDetail['details'];
        deduction = calculateTotalDeductionAmount(detail_payroll, 'deduction');
        allowance = calculateTotalDeductionAmount(detail_payroll, 'allowance');
        emptyData = false;
      } else {
        id_payroll = 0.obs;
        basic_salary = 0.0;
        net_salary = 0.0;
        detail_payroll = [];
        deduction = 0.0;
        allowance = 0.0;
        emptyData = true;
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load employee data');
    } finally {
      isLoading.value = false;
    }
  }

  requestLinkDownloadPayslip(token, payroll_id) async{
    print(payroll_id);
    var path = "${BaseServer.serverUrl}/generate-slip-gaji/";
    Map<String, dynamic> bodyParams = {
      "payroll_id": '${payroll_id}',
    };
    var body = json.encode(bodyParams);

    var response = await http.post(
      Uri.parse(path),
      body: body,
      headers: {
        "content-type": "application/json",
        "Authorization": "Bearer $token",
      },
    );
    
    return response;
  }

  retriveLinkDownloadPayslip()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var result = await requestLinkDownloadPayslip(token, id_payroll.value);
    return Constants().jsonResponse(result);
  }

  double calculateTotalDeductionAmount(
      List<dynamic> detail_payroll, String type) {
    double total = 0.0;
    for (var item in detail_payroll) {
      if (item['type'] == type) {
        total += item['amount'];
      }
    }
    return total;
  }

  String formatDate(DateTime date) {
    DateFormat formatter = DateFormat('yyyy-MM');
    String formattedDate = formatter.format(date);
    return formattedDate;
  }

  String formatCurrency(double amount) {
    final formatter = NumberFormat("#,##0", "en_US");
    return formatter.format(amount).replaceAll(',', '.');
  }
}
