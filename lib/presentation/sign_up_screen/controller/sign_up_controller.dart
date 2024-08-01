import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/sign_up_screen/models/sign_up_model.dart';
import 'package:flutter/material.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Rx<SignUpModel> signUpModelObj = SignUpModel().obs;
  Rx<bool> isShowPassword = true.obs;

  @override
  void onReady() {
    super.onReady();
  }


}
