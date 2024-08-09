import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app_export.dart';
import 'package:app_tracking_transparency/app_tracking_transparency.dart';

// Future<void> requestTrackingPermission() async {
//   final status = await AppTrackingTransparency.trackingAuthorizationStatus;
//   if (status == TrackingStatus.notDetermined) {
//     final trackingStatus = await AppTrackingTransparency.requestTrackingAuthorization();
//   }
// }
Future<void> requestTrackingPermission() async {
  try {
    final status = await AppTrackingTransparency.trackingAuthorizationStatus;
    if (status == TrackingStatus.notDetermined) {
      final trackingStatus = await AppTrackingTransparency.requestTrackingAuthorization();
      print('Tracking status: $trackingStatus');
    } else {
      print('Tracking status: $status');
    }
  } on PlatformException catch (e) {
    print('Error requesting tracking permission: $e');
  }
}

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light, // For iOS: (dark icons)
      statusBarIconBrightness: Brightness.dark, // For Android: (dark icons)
    ),
  );
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((value) async {
    // Meminta izin pelacakan
    await requestTrackingPermission();
    
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}




class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true,  dialogTheme: DialogTheme(
          backgroundColor: ColorConstant.whiteA700, surfaceTintColor: ColorConstant.whiteA700), dropdownMenuTheme: DropdownMenuThemeData(inputDecorationTheme: InputDecorationTheme(fillColor: ColorConstant.whiteA700)),
          elevatedButtonTheme: ElevatedButtonThemeData()),
      translations: AppLocalization(),
      locale: Get.deviceLocale, //for setting localization strings
      fallbackLocale: Locale('en', 'US'),
      title: 'fastteam_app',
      initialBinding: InitialBindings(),
      initialRoute: AppRoutes.initialRoute,
      getPages: AppRoutes.pages,
    );
  }
}
