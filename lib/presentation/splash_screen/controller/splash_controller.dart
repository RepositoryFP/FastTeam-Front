import 'dart:async';

import 'package:fastteam_app/core/app_export.dart';
import 'package:fastteam_app/presentation/splash_screen/models/splash_model.dart';

class SplashController extends GetxController {
  Rx<SplashModel> splashModelObj = SplashModel().obs;

  @override
  void onReady() {
    super.onReady();
    Future.delayed(const Duration(milliseconds: 3000), () {
      _getIsFirst();
    });
  }

  _getIsFirst() async {
    bool isSignIn = await PrefUtils.getIsSignIn();
    bool isIntro = await PrefUtils.getIsIntro();
    Timer(const Duration(seconds: 3), () {
      print("is intro ====== ${isIntro}");
      print("isSignIn ====== ${isSignIn}");
      // if (isSignIn || isIntro) {
      //   Get.toNamed(AppRoutes.logInScreen);
      // } else {
      Get.toNamed(AppRoutes.homeContainerScreen);

      // }
    });
  }

  @override
  void onClose() {
    super.onClose();
  }
}
