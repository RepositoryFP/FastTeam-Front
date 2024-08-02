import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/reset_password_screen/models/reset_password_model.dart';
import 'package:flutter/cupertino.dart';

class ResetPasswordController extends GetxController {
  Rx<ResetPasswordModel> resetPasswordModelObj = ResetPasswordModel().obs;
  TextEditingController newpasswordController = TextEditingController();

  TextEditingController confirmpasswordController = TextEditingController();


  Rx<bool> isShowPassword = true.obs;

  Rx<bool> isShowPassword1 = true.obs;

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
