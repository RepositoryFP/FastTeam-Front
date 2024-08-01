import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/employee_screen/models/employee_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class EmployeeController extends GetxController {
  var responseModel =
      ResponseModel(status: 0, details: Details(status: '', data: [])).obs;

  var isLoading = false.obs;
  var isDataLoaded = false.obs;
  var filteredEmployees = <User>[].obs; // Add a filtered list

  String searchingText = "";

  @override
  void onReady() {
    super.onReady();
    retrieveEmployeeList(); // Fetch the employee list when the controller is ready
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSerching(String value) {
    print(value);
    searchingText = value;
    updateFilteredEmployees(); // Update filtered employees when searching text changes
    update(); // Update UI
  }

  Future<http.Response> requestEmployeeData(String? token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/user-absen/?all=1"),
            headers: headers)
        .timeout(BaseServer.durationlimit);

    return response;
  }

  void retrieveEmployeeList() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      isLoading.value = true;
      if (isDataLoaded.value) return;

      var token = prefs.getString('token');
      if (token == null) {
        // Handle the case where token is null
        print('Token is null');
        return; // You may want to handle this scenario better
      }

      var result = await requestEmployeeData(token);
      var data = Constants().jsonResponse(result);

      if (data['status'] == 200) {
        responseModel.value = ResponseModel.fromJson(data);
        isDataLoaded.value = true;

        // Update the filtered employees list after loading data
        updateFilteredEmployees();
      } else {
        print('Failed to retrieve employee data: ${data['details']}');
      }
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load employee data');
    } finally {
      isLoading.value = false;
    }
  }

  void updateFilteredEmployees() {
    if (searchingText.isEmpty) {
      filteredEmployees.value = List.from(responseModel.value.details.data); // Ensure a fresh copy
    } else {
      filteredEmployees.value = responseModel.value.details.data
          .where((user) => user.nama.value.toLowerCase().contains(searchingText.toLowerCase()))
          .toList(); // Ensure toList() is called
    }
  }
}
