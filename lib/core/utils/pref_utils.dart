//ignore: unused_import
import 'dart:convert';
import 'package:fastteam_app/core/constants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefUtils {
  static SharedPreferences? _sharedPreferences;
  static String prefName = "com.carwashapp.app";
  static String isIntro = "${prefName}isIntro";
  static String signIn = "${prefName}signIn";
  PrefUtils() {
    SharedPreferences.getInstance().then((value) {
      _sharedPreferences = value;
    });
  }

  Future<void> init() async {
    _sharedPreferences ??= await SharedPreferences.getInstance();
    print('SharedPreference Initialized');
  }

  ///will clear all the data stored in preference
  static clearPreferencesData() async {
    _sharedPreferences!.clear();
  }

  static setIsIntro(bool sizes) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(isIntro, sizes);
  }

  static getIsIntro() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool intValue = prefs.getBool(isIntro) ?? true;
    return intValue;
  }

  static setIsSignIn(bool isFav) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(signIn, isFav);
  }

  static getIsSignIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // print(prefs.getString('token')!.isNotEmpty && prefs.getBool(signIn)!)
    var isSignIn = prefs.getBool(signIn) ?? true;
    if (isSignIn) {
      return true;
    } else {
      return false;
    }
  }

  static storeUserInfo(jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('user-id_user', jsonData['id_user']);
    await prefs.setInt('user-employee_id', jsonData['empoloyee_id']);
    await prefs.setInt('user-id_divisi', jsonData['divisi_id']);
    await prefs.setString('user-email', jsonData['email']);
    await prefs.setString('user-nama', jsonData['nama']);
    await prefs.setString('user-img_prof', jsonData['img_prof']);
    await prefs.setString('user-img_url', jsonData['img_url']);
    await prefs.setString('user-kantor', jsonData['shift']['name']);
    await prefs.setString('user-masuk_awal', jsonData['clock_in']['min']);
    await prefs.setString('user-masuk_akhir', jsonData['clock_in']['max']);
    await prefs.setString('user-keluar_awal', jsonData['clock_out']['min']);
    await prefs.setString('user-keluar_akhir', jsonData['clock_out']['max']);

    // Format clock_in_time and clock_out_time to "H:mm" format
    final clockInTime = jsonData['shift']['clock_in_time'] != null
        ? TimeHelper().formatTime(jsonData['shift']['clock_in_time'])
        : '';
    final clockOutTime = jsonData['shift']['clock_out_time'] != null
        ? TimeHelper().formatTime(jsonData['shift']['clock_out_time'])
        : '';

    await prefs.setString('user-shift', '$clockInTime - $clockOutTime');
  }

  static storeJsonUser(jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString =
        json.encode(jsonData); // Convert the map to a JSON string
    // print(jsonString);
    prefs.setString('jsonUser', jsonString);
  }

  static storeUserToken(jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = json.encode(jsonData).replaceAll('"', '');
    prefs.setString('token', token);
  }

  static storeEmployeeInfo(jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonString = json.encode(jsonData);
    // print(jsonData['divisi']['name']);
    prefs.setString('jsonEmployeeInfo', jsonString);
    await prefs.setString(
        'emp-full_name', "${jsonData['nama_awal']} ${jsonData['nama_akhir']}");
    await prefs.setString('emp-divisi', jsonData['divisi']['name']);
    await prefs.setString('emp-posisi', jsonData['posisi_pekerjaan']['name']);
    await prefs.setString('emp-email', jsonData['email']);
    await prefs.setInt('emp-nomor_ktp', jsonData['nomor_ktp']);
  }

  static storeCoordinateUser(lat, long) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('user-position_lat', lat);
    await prefs.setDouble('user-position_long', long);
  }
}
