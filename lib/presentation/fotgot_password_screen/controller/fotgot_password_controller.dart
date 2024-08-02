import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/fotgot_password_screen/models/fotgot_password_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class FotgotPasswordController extends GetxController {
  TextEditingController emailController = TextEditingController();

  Rx<FotgotPasswordModel> fotgotPasswordModelObj = FotgotPasswordModel().obs;

  @override
  void onReady() {
    super.onReady();
  }

requestResetPassword(email) async {
    Map<String, dynamic> bodyParams = {
      'email': email,
    };

    var response = await http.post(
      Uri.parse("${BaseServer.serverUrl}/user/reset_password/"),
      body: bodyParams,
      // headers: {
      //   "Authorization": "Bearer $token",
      // },
    ).timeout(BaseServer.durationlimit);

    return response;
  }
  sendResetPassword(email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getString('token');
    var result = await requestResetPassword(email);

    return Constants().jsonResponse(result);
  }
}
