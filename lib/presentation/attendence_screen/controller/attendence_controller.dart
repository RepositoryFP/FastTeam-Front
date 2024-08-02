import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/attendence_screen/models/attendence_model.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AttendenceController extends GetxController {
  List<AttendanceRecord> attendanceList = [];

  var isLoading = false.obs;
  var isDataLoaded = false.obs;

  String searchingText = "";

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSerching(String value) {
    print(value);
    searchingText = value;

    update(); // Update UI
  }

  Future<http.Response> retrieveAttendanceList(
      int userId, String? token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(
            Uri.parse(
                "${BaseServer.serverUrl}/pengajuan-absensi/list/$userId/"),
            headers: headers)
        .timeout(BaseServer.durationlimit);

    return response;
  }

  Future<void> getAttendanceList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var userId = prefs.getInt('user-id_user');
    isLoading.value = true;
    try {
      var result = await retrieveAttendanceList(userId!, token);
      var response = Constants().jsonResponse(result);
      
      attendanceList = (response['details'] as List).map((data) => AttendanceRecord.fromJson(data)).toList();
      isDataLoaded.value = true;
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
