
import 'package:fastteam_app/core/constants/constants.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class MilestoneController extends GetxController {
  List<dynamic> arrayData = [];
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

  retriveJobHistory(userId, token) async {
    var path = "${BaseServer.serverUrl}/job-history/${userId}/";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http.get(
      Uri.parse(path),
      headers: headers,
    );

    return response;
  }

  void retrieveJobHistory() async {
    try {
      if (isDataLoaded.value) return;
      isLoading.value = true;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var userId = prefs.getInt('user-employee_id');

      var result = await retriveJobHistory(userId, token);

      var data = Constants().jsonResponse(result);
      arrayData = data['details'];
      print("data = $arrayData");
    } catch (e) {
      print('Error occurred: $e');
      throw Exception('Failed to load employee data');
    } finally {
      isLoading.value = false;
    }
  }
}
