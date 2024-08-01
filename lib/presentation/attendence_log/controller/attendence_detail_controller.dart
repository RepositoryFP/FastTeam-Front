import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AttendenceDetailController extends GetxController {
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

  retriveDetailAbsensi(token, userId) async {
    var path = "${BaseServer.serverUrl}/log-absen/detail/$userId/";
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var response = await http
        .get(Uri.parse(path), headers: headers)
        .timeout(BaseServer.durationlimit);

    return response;
  }

  retriveDetailAbsenst(userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var detailAbsenst =
        await retriveDetailAbsensi(token, userId);
    return Constants().jsonResponse(detailAbsenst);
  }
}