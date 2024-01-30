import 'dart:convert';

import 'package:flutter/foundation.dart';

AccountInformationModel accountInformationModelFromJson(String str) =>
    AccountInformationModel.fromJson(json.decode(str));

class AccountInformationModel {
  int? id;
  int? id_employee;
  String? namaAwal;
  String? fullName;
  String? namaAkhir;
  String? nomorHp;
  String? tanggalLahir;
  String? email;
  String? statusKawin;
  int? nomorKtp;
  String? divisi;
  String? posisiPekerjaan;
  String? levelPekerjaan;
  String? lokasiGroup;
  String? bank;
  String? user;
  String? gender;
  String? agama;
  String? statusPegawai;
  String? cabang;
  String? imgProfUrl;
  String? tempatLahir;
  String? alamatKtp;
  String? alamatTinggal;
  String? gaji;
  String? nomorRekening;
  String? shift;
  String? masukAwal;
  String? masukAkhir;
  String? keluarAwal;
  String? keluarAkhir;

  AccountInformationModel({
    this.id,
    this.id_employee,
    this.fullName,
    this.namaAwal,
    this.namaAkhir,
    this.nomorHp,
    this.tanggalLahir,
    this.email,
    this.statusKawin,
    this.nomorKtp,
    this.divisi,
    this.posisiPekerjaan,
    this.levelPekerjaan,
    this.lokasiGroup,
    this.bank,
    this.user,
    this.gender,
    this.agama,
    this.statusPegawai,
    this.cabang,
    this.imgProfUrl,
    this.tempatLahir,
    this.alamatKtp,
    this.alamatTinggal,
    this.gaji,
    this.nomorRekening,
    this.shift,
    this.masukAkhir,
    this.masukAwal,
    this.keluarAkhir,
    this.keluarAwal,
  });

  factory AccountInformationModel.fromJson(Map<String, dynamic> json) =>
      AccountInformationModel(
        id: json['user']['id'],
        id_employee: json['id'],
        divisi: json['divisi']['name'],
        email: json['email'],
        fullName: "${json['nama_awal']} ${json['nama_akhir']}",
        imgProfUrl: json['img_prof_url'],
        gender: json['gender']['name'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: json['tanggal_lahir'],
        nomorHp: json['nomor_hp'],
        statusKawin: json['status_kawin']['name'],
        agama: json['agama']['name'],
        nomorKtp: json['nomor_ktp'],
        alamatKtp: json['alamat_ktp'],
        alamatTinggal: json['alamat_tinggal'],
        cabang: json['cabang']['name'],
        shift:
            "${json['shift']['clock_in_time']} - ${json['shift']['clock_out_time']}",
        masukAkhir: json['clock_in']['max'],
        masukAwal: json['clock_in']['min'],
        keluarAkhir: json['clock_out']['max'],
        keluarAwal: json['clock_out']['min'],
      );
}
