class User {
  final int? id;
  final String? name;
  final String? photo;

  User({
    this.id,
    this.name,
    this.photo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
    };
  }
}

class Overtime {
  final User? user;
  final String? tanggal;
  final int? status;
  final String? jamMulai;
  final String? jamSelesai;
  final String? mulaiIstirahat;
  final String? akhirIstirahat;

  Overtime({
    this.user,
    this.tanggal,
    this.status,
    this.jamMulai,
    this.jamSelesai,
    this.mulaiIstirahat,
    this.akhirIstirahat,
  });

  factory Overtime.fromJson(Map<String, dynamic> json) {
    return Overtime(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      tanggal: json['tanggal'],
      status: json['status'],
      jamMulai: json['jam_mulai'],
      jamSelesai: json['jam_selesai'],
      mulaiIstirahat: json['mulai_istirahat'],
      akhirIstirahat: json['akhir_istirahat'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'tanggal': tanggal,
      'status': status,
      'jam_mulai': jamMulai,
      'jam_selesai': jamSelesai,
      'mulai_istirahat': mulaiIstirahat,
      'akhir_istirahat': akhirIstirahat,
    };
  }
}
