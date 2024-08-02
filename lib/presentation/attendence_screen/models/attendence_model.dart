class User {
  final int id;
  final String name;
  final String photo;

  User({
    required this.id,
    required this.name,
    required this.photo,
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

class AttendanceRecord {
  final User user;
  final String tanggal;
  final int status;
  final String bukti;
  final String jenis;

  AttendanceRecord({
    required this.user,
    required this.tanggal,
    required this.status,
    required this.bukti,
    required this.jenis,
  });

  factory AttendanceRecord.fromJson(Map<String, dynamic> json) {
    return AttendanceRecord(
      user: User.fromJson(json['user']),
      tanggal: json['tanggal'],
      status: json['status'],
      bukti: json['bukti'],
      jenis: json['jenis'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user.toJson(),
      'tanggal': tanggal,
      'status': status,
      'bukti': bukti,
      'jenis': jenis,
    };
  }
}
