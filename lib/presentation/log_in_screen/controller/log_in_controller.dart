import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/log_in_screen/models/log_in_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LogInController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<LogInModel> logInModelObj = LogInModel().obs;
  Rx<bool> isShowPassword = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  requestLogin(email, password) async {
    Map<String, dynamic> bodyParams = {
      'email': email,
      'password': password,
    };
    var response = await http
        .post(
          Uri.parse("${BaseServer.serverUrl}/user-login/"),
          body: bodyParams,
        )
        .timeout(BaseServer.durationlimit);
    return Constants().jsonResponse(response);
  }

  retrieveEmployeeInfo(userId) async {
    try {
      var response = await http
          .get(Uri.parse(
              "${BaseServer.serverUrl}/personal-info/$userId/"))
          .timeout(BaseServer.durationlimit);
      return Constants().jsonResponse(response);
    } catch (e) {
      return {
        "status": 500,
        "details":
            "Terjadi gangguan ketika mengambil data. Silahkan menghubungi Administrator untuk lebih lanjut."
      };
    }
  }

  storeUserInfo(jsonData) async {
    await PrefUtils.storeUserInfo(jsonData);
  }

  storeToken(jsonData) async {
    await PrefUtils.storeUserToken(jsonData);
  }

  storeEmployeeInfo(jsonData) async {
    await PrefUtils.storeEmployeeInfo(jsonData);
  }

  storeJsonUser(jsonData) async {
    await PrefUtils.storeJsonUser(jsonData);
  }
}
