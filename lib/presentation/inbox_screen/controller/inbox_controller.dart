import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InboxController extends GetxController {
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

  retrieveNotificationList(userId, token) async {
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse("${BaseServer.serverUrl}/notification/$userId/"),
            headers: headers)
        .timeout(BaseServer.durationlimit);

    return response;
  }

  getNotificationList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var userId = prefs.getInt('user-id_user');
    var result = await retrieveNotificationList(userId, token);

    var response =  Constants().jsonResponse(result);
    // print(response);
  }
}
