import 'package:get/get.dart';

// User Model
class User {
  final RxInt idUser;
  final RxString nama;
  final RxString divisi;
  final RxString image;
  final RxInt clockIn;
  final RxInt clockOut;
  final RxList<dynamic> jamMasuk;
  final RxList<dynamic> jamKeluar;
  final RxString email;
  final RxString wa;

  User({
    required int idUser,
    required String nama,
    required String divisi,
    required String image,
    required int clockIn,
    required int clockOut,
    required List<dynamic> jamMasuk,
    required List<dynamic> jamKeluar,
    required String email,
    required String wa,
  })  : idUser = RxInt(idUser),
        nama = RxString(nama),
        divisi = RxString(divisi),
        image = RxString(image),
        clockIn = RxInt(clockIn),
        clockOut = RxInt(clockOut),
        jamMasuk = RxList<dynamic>(jamMasuk),
        jamKeluar = RxList<dynamic>(jamKeluar),
        email = RxString(email),
        wa = RxString(wa);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['id_user'],
      nama: json['nama'],
      divisi: json['divisi'],
      image: json['image'],
      clockIn: json['clock_in'],
      clockOut: json['clock_out'],
      jamMasuk: List<dynamic>.from(json['jam_masuk']),
      jamKeluar: List<dynamic>.from(json['jam_keluar']),
      email: json['email'],
      wa: json['wa'],
    );
  }
}

// Details Model
class Details {
  final RxString status;
  final RxList<User> data;

  Details({
    required String status,
    required List<User> data,
  })  : status = RxString(status),
        data = RxList<User>(data);

  factory Details.fromJson(Map<String, dynamic> json) {
    return Details(
      status: json['status'],
      data: (json['data'] as List).map((i) => User.fromJson(i)).toList(),
    );
  }
}

// Response Model
class ResponseModel {
  final RxInt status;
  final Details details;

  ResponseModel({
    required int status,
    required Details details,
  })  : status = RxInt(status),
        details = details;

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json['status'],
      details: Details.fromJson(json['details']),
    );
  }
}
