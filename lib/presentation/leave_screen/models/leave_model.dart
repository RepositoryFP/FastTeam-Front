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

class Cuti {
  final int? id;
  final String? name;

  Cuti({
    this.id,
    this.name,
  });

  factory Cuti.fromJson(Map<String, dynamic> json) {
    return Cuti(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

class AttendanceRecord {
  final User? user;
  final Cuti? cuti;
  final String? tanggal;
  final int? status;
  final String? alasan;
  final String? bukti;

  AttendanceRecord({
    this.user,
    this.cuti,
    this.tanggal,
    this.status,
    this.alasan,
    this.bukti,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      cuti: json['cuti'] != null ? Cuti.fromJson(json['cuti']) : null,
      tanggal: json['tanggal'],
      status: json['status'],
      alasan: json['alasan'],
      bukti: json['bukti'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'cuti': cuti?.toJson(),
      'tanggal': tanggal,
      'status': status,
      'alasan': alasan,
      'bukti': bukti,
    };
  }
}
