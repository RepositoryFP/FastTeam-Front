import 'dart:convert';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/core/network/base_url.dart';
import 'package:fastteam_app/presentation/log_in_screen/controller/log_in_controller.dart';
import 'package:fastteam_app/presentation/reset_password_one_dialog/reset_password_one_dialog.dart';
import 'package:fastteam_app/presentation/reset_password_screen/models/reset_password_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ResetPasswordController extends GetxController {
  Rx<ResetPasswordModel> resetPasswordModelObj = ResetPasswordModel().obs;

  TextEditingController passwordController = TextEditingController();
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();

  LogInController controller = Get.put(LogInController());

  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  Rx<bool> isShowPassword2 = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  requestLoginUser(context, username, password) async {
    var loginResult = await controller.requestLogin(username, password);

    if (loginResult['status'] == 200) {
      if (loginResult['details']['status'] == 'error') {
        showCustomSnackBar(
          context: context,
          msg: loginResult['details']['message'],
          status: "ERROR",
        );
      } else {
        var result = await requestChangePassword();
        if (result['status'] == 200) {
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) {
              return AlertDialog(
                insetPadding: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                contentPadding: EdgeInsets.zero,
                content: ResetPasswordOneDialog(),
              );
            },
          );
        } else {
          showCustomSnackBar(
            context: context,
            msg: "Failed to change your password",
            status: "ERROR",
          );
        }
      }
    } else {
      showCustomSnackBar(
        context: context,
        msg: "Server in trouble",
        status: "ERROR",
      );
    }
  }

  requestLogin(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var userEmail = prefs.getString('user-email');
    requestLoginUser(context, userEmail, passwordController.text);
  }

  requestChangePassword() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var idUser = prefs.getInt('user-id_user');
    var result = await changePassword(token, idUser, passwordController.text);
    return Constants().jsonResponse(result);
  }

  changePassword(token, id_user, password) async {
    Map<String, dynamic> bodyParams = {
      'id_user': "$id_user",
      'password': password,
    };
    var body = json.encode(bodyParams);
    print(body);
    var response = await http.post(
      Uri.parse("${BaseServer.serverUrl}/change-password/"),
      body: body,
      headers: {
        'Content-Type': 'application/json',
        "Authorization": "Bearer $token",
      },
    ).timeout(BaseServer.durationlimit);
    return response;
  }

  void showCustomSnackBar({
    required BuildContext context,
    required String msg,
    required String status,
  }) {
    final Color backgroundColor;
    final Icon icon;

    switch (status) {
      case "SUCCESS":
        backgroundColor = Colors.green;
        icon = Icon(Icons.check_circle, color: Colors.white);
        break;
      case "ERROR":
        backgroundColor = Colors.red;
        icon = Icon(Icons.error, color: Colors.white);
        break;
      case "WARNING":
        backgroundColor = Colors.orange;
        icon = Icon(Icons.warning, color: Colors.white);
        break;
      default:
        backgroundColor = Colors.black;
        icon = Icon(Icons.info, color: Colors.white);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            icon,
            SizedBox(width: 8),
            Expanded(child: Text(msg)),
          ],
        ),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
