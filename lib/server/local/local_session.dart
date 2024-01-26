import 'package:shared_preferences/shared_preferences.dart';
import 'package:Fast_Team/helpers/time_helper.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class LocalSession {
  static var idUser = 0.obs;
  static var idDivisi = 0.obs;
  static var email = "".obs;
  static var nama = "".obs;
  static var divisi = "".obs;
  static var posLat = 0.0.obs;
  static var posLong = 0.0.obs;
  static var imgProf = "".obs;
  static var kantor = "".obs;
  static var masukAwal = "".obs;
  static var masukAkhir = "".obs;
  static var keluarAwal = "".obs;
  static var keluarAkhir = "".obs;
  static var statusLogin = "".obs;

  storeUserInfo(jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('user-id_user', jsonData['id_user']);
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

  retriveUserInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    idUser.value = prefs.getInt('user-id_user')!;
    idDivisi.value = prefs.getInt('user-id_divisi')!;
    email.value = prefs.getString('user-email')!;
    nama.value = prefs.getString('user-nama')!;
    // divisi.value = prefs.getString('user-divisi')!;
    posLat.value = prefs.getDouble('user-position_lat')!;
    posLong.value = prefs.getDouble('user-position_long')!;
    imgProf.value = prefs.getString('user-img_prof')!;
    kantor.value = prefs.getString('user-kantor')!;
    masukAwal.value = prefs.getString('user-masuk_awal')!;
    masukAkhir.value = prefs.getString('user-masuk_akhir')!;
    keluarAwal.value = prefs.getString('user-keluar_awal')!;
    keluarAkhir.value = prefs.getString('user-keluar_akhir')!;
  }

  storeEmployeeInfo(jsonData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString(
        'emp-full_name', "${jsonData['nama_awal']} ${jsonData['nama_akhir']}");
    await prefs.setString('emp-date_birth', jsonData['tanggal_lahir']);
    await prefs.setString('emp-email', jsonData['email']);
    await prefs.setInt('emp-nomor_ktp', jsonData['nomor_ktp']);
  }

  storeCoordinateUser(lat, long) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('user-position_lat', lat);
    await prefs.setDouble('user-position_long', long);
  }

  retrieveIsLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('user-id_user') != 0 ||
        prefs.getInt('user-id_user') != null) {
      statusLogin.value = "true";
    } else {
      statusLogin.value = "false";
    }
  }
}
