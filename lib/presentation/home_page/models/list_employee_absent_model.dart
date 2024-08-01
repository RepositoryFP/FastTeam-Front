class EmployeeAbsentResponse {
  String status;  // Ubah tipe data menjadi String
  EmployeeAbsentDetails details;

  EmployeeAbsentResponse({required this.status, required this.details});

  factory EmployeeAbsentResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeAbsentResponse(
      status: json['status'],
      details: EmployeeAbsentDetails.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': details.toJson(),
    };
  }
}

class EmployeeAbsentDetails {
  List<EmployeeAbsent> data;

  EmployeeAbsentDetails({required this.data});

  factory EmployeeAbsentDetails.fromJson(List<dynamic> json) {
    List<EmployeeAbsent> dataList = json.map((i) {
      return EmployeeAbsent.fromJson(i);
    }).toList();
    
    return EmployeeAbsentDetails(
      data: dataList,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data.map((v) => v.toJson()).toList(),
    };
  }
}

class EmployeeAbsent {
  int idUser;
  String nama;
  String divisi;
  String image;
  int clockIn;
  int clockOut;
  List<JamAbsen> jamMasuk; // Ganti menjadi List<JamAbsen>
  List<JamAbsen> jamKeluar; // Ganti menjadi List<JamAbsen>
  String email;
  String wa;

  EmployeeAbsent({
    required this.idUser,
    required this.nama,
    required this.divisi,
    required this.image,
    required this.clockIn,
    required this.clockOut,
    required this.jamMasuk,
    required this.jamKeluar,
    required this.email,
    required this.wa,
  });

  factory EmployeeAbsent.fromJson(Map<String, dynamic> json) {
    return EmployeeAbsent(
      idUser: json['id_user'],
      nama: json['nama'],
      divisi: json['divisi'],
      image: json['image'],
      clockIn: json['clock_in'],
      clockOut: json['clock_out'],
      jamMasuk: (json['jam_masuk'] as List).map((i) => JamAbsen.fromJson(i)).toList(), // Menggunakan JamAbsen
      jamKeluar: (json['jam_keluar'] as List).map((i) => JamAbsen.fromJson(i)).toList(), // Menggunakan JamAbsen
      email: json['email'],
      wa: json['wa'].toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id_user': idUser,
      'nama': nama,
      'divisi': divisi,
      'image': image,
      'clock_in': clockIn,
      'clock_out': clockOut,
      'jam_masuk': jamMasuk.map((v) => v.toJson()).toList(), // Menggunakan JamAbsen
      'jam_keluar': jamKeluar.map((v) => v.toJson()).toList(), // Menggunakan JamAbsen
      'email': email,
      'wa': wa,
    };
  }
}

class JamAbsen {
  String jamAbsen;

  JamAbsen({required this.jamAbsen});

  factory JamAbsen.fromJson(Map<String, dynamic> json) {
    return JamAbsen(
      jamAbsen: json['jam_absen'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jam_absen': jamAbsen,
    };
  }
}
