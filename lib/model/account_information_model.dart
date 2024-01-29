import 'dart:convert';

import 'package:flutter/foundation.dart';

AccountInformationModel accountInformationModelFromJson(String str) =>
    AccountInformationModel.fromJson(json.decode(str));

class AccountInformationModel {
  int? id;
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

  AccountInformationModel({
    this.id,
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
  });

  factory AccountInformationModel.fromJson(Map<String, dynamic> json) =>
      AccountInformationModel(
        id: json['id'],
        divisi: json['divisi']['name'],
        email: json['email'],
        fullName: "${json['nama_awal']} ${json['nama_akhir']}",
        imgProfUrl: json['img_url'],
        gender: json['gender']['name'],
        tempatLahir: json['tempat_lahir'],
        tanggalLahir: json['tanggal_lahir'],
        nomorHp: json['nomor_hp'],
        statusKawin: json['status_kawin']['name'],
        agama: json['agama']['name'],
        nomorKtp: json['nomor_ktp'],
        alamatKtp: json['alamat_ktp'],
        alamatTinggal: json['alamat_tinggal'],
      );
}
