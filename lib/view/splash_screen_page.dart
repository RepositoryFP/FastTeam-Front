import 'dart:async';
import 'package:Fast_Team/style/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    Duration timers = const Duration(seconds: 3);
    return Timer(timers, () => navigationPage());
  }

  navigationPage() async {
    setState(() {
      Navigator.pushReplacementNamed(context, '/navigation');
    });
  }

  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      child: SafeArea(
        child: Scaffold(
          body: Center(
              child: Image.asset('assets/img/logo_besar.jpg',
                  height: 300, width: 300)),
          backgroundColor: ColorsTheme.white!,
        ),
      ),
      value: SystemUiOverlayStyle(statusBarColor: ColorsTheme.white!),
    );
  }
}
