import 'package:flutter/material.dart';
import 'package:Fast_Team/user/login.dart';
import 'package:Fast_Team/user/home.dart';
import 'package:Fast_Team/user/map.dart';
import 'package:Fast_Team/user/kamera.dart';
import 'package:Fast_Team/user/absensi.dart';
import 'package:Fast_Team/user/detailAbsensi.dart';
import 'package:Fast_Team/user/daftarAbsensi.dart';
import 'package:Fast_Team/user/daftarKehadiran.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:Fast_Team/utils/bottom_navigation_bar.dart';
import 'package:Fast_Team/user/profile.dart';
import 'package:Fast_Team/user/request.dart';
import 'package:Fast_Team/user/history.dart';
import 'package:Fast_Team/user/employee.dart';
import 'package:Fast_Team/user/inbox.dart';
import 'package:Fast_Team/user/approval.dart';
import 'package:Fast_Team/user/sertificate.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Pastikan Flutter sudah terinisialisasi
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  String avatarImageUrl = sharedPreferences.getString('user-img_url') ?? '';
  int userId = sharedPreferences.getInt('user-id_user') ?? 0;
  print(userId);
  bool loggedIn = userId > 0;
  runApp(MyApp(avatarImageUrl: avatarImageUrl, loggedIn: loggedIn));
}

class MyApp extends StatelessWidget {
  final String avatarImageUrl;
  final bool loggedIn;

  static const Color navyBlue =
      Color.fromARGB(255, 2, 65, 128); // Nilai warna biru navy

  MyApp({required this.avatarImageUrl, required this.loggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        MonthYearPickerLocalizations.delegate,
      ],
      title: 'Fast Team',
      theme: ThemeData(
        primaryColor:
            navyBlue, // Menggunakan warna biru navy sebagai primary color
        primarySwatch:
            navyBlueSwatch, // Menggunakan warna biru navy sebagai primary swatch
      ),
      // initialRoute: '/',
      initialRoute: '/', // Set rute awal ke '/splash'
      routes: {
        '/': (context) => AnimatedSplashScreen(
              splash: Image.asset('assets/img/logo_besar.jpg',
                  height: 1000, width: 1000),
              splashTransition: SplashTransition.fadeTransition,
              duration: 3000,
              nextScreen: loggedIn ? HomePage() : LoginPage(),
            ),
        '/home': (context) => HomePage(),
        '/map': (context) => MapPage(),
        '/kamera': (context) => KameraPage(),
        '/absensi': (context) => AbsensiPage(),
        '/detailAbsensi': (context) => DetailAbsensiPage(),
        '/daftarAbsensi': (context) => DaftarAbsensiPage(),
        '/profile': (context) => ProfilePage(),
        '/request': (context) => RequestPage(),
        '/daftarKehadiran': (context) => DaftarKehadiranPage(),
        '/history': (context) => History(),
        '/employee': (context) => EmployeePage(),
        '/inbox': (context) => InboxPage(),
        '/approval': (context) => ApprovalPage(),
        '/sertificate': (context) => SertificatePage(),
      },
    );
  }

  // Membuat primary swatch berdasarkan warna biru navy
  MaterialColor get navyBlueSwatch {
    return MaterialColor(
      navyBlue.value,
      <int, Color>{
        50: navyBlue,
        100: navyBlue,
        200: navyBlue,
        300: navyBlue,
        400: navyBlue,
        500: navyBlue,
        600: navyBlue,
        700: navyBlue,
        800: navyBlue,
        900: navyBlue,
      },
    );
  }
}
