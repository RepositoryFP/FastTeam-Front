import 'dart:async';
import 'package:Fast_Team/controller/login_controller.dart';
import 'package:Fast_Team/server/local/local_session.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:Fast_Team/style/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LoginController? controller;

  var isLogin;
  var userId;
  @override
  void initState() {
    super.initState();
    initConstructor();

    
  }

  initConstructor() async {
    controller = Get.put(LoginController());
    await initData();
    startTime();
    
  }

  initData() async {
    LocalSession localSession = Get.put(LocalSession());
    await localSession.retriveUserInfo();
   
    userId = LocalSession.idUser.value ?? 0;

    if (userId > 0) {
      isLogin = "true".obs;
    } else {
      isLogin = "false".obs;
    }
  }

  startTime() async {
    Duration timers = const Duration(seconds: 3);
    return Timer(timers, () => navigationPage());
  }

  navigationPage() async {
    if (isLogin.value == "true") {
      setState(() {
        Navigator.pushReplacementNamed(context, '/navigation');
      });
    } else {
      setState(() {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: Center(
              child: Image.asset('assets/img/logo_besar.jpg',
                  height: 200.h, width: 200.w)),
          backgroundColor: ColorsTheme.white!,
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.white!),
    );
  }
}
