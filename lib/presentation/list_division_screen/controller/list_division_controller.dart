import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/home_page/controller/home_controller.dart';
import 'package:fastteam_app/presentation/home_page/models/home_model.dart';
import 'package:fastteam_app/presentation/home_page/models/list_employee_absent_model.dart';
import 'package:fastteam_app/presentation/inbox_screen/models/inbox_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ListDivisionController extends GetxController {
  String serchingText = "";

  var notifications = <NotificationModel>[].obs;
  var notificationDetail = <NotificationModel>[].obs;
  var isLoading = false.obs;
  var isDataLoaded = false.obs;
  var responseModel = EmployeeAbsentResponse(
      status: '0', details: EmployeeAbsentDetails(data: [])).obs;
  var filteredEmployees = <EmployeeAbsent>[].obs;
  HomeController controller = Get.put(HomeController(HomeModel().obs));
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

  // void getDataDivision(date) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
    
    
  //   getListBelumAbsen(date,)
  // }

  void getListBelumAbsen(String tanggal) async {
    // Early return if data is already loaded
    if (isDataLoaded.value) return;
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var idDivisi = prefs.getInt('user-id_divisi');
      isLoading.value = true;

      http.Response response;
      if (idDivisi! > 0) {
        response = await controller.retrieveUserAbsenDateDivisi(
            token, tanggal, idDivisi);
      } else {
        response = await controller.retrieveUserAbsenOnly(token);
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
}
