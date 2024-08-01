class Sender {
  final int? id;
  final String? name;
  final String? photo;
  final String? divisi;

  Sender({
    this.id,
    this.name,
    this.photo,
    this.divisi,
  });

  factory Sender.fromJson(Map<String, dynamic> json) {
    return Sender(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      divisi: json['divisi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'divisi': divisi,
    };
  }
}

class Recipient {
  final int? id;
  final String? name;
  final String? photo;
  final String? divisi;

  Recipient({
    this.id,
    this.name,
    this.photo,
    this.divisi,
  });

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      id: json['id'],
      name: json['name'],
      photo: json['photo'],
      divisi: json['divisi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'photo': photo,
      'divisi': divisi,
    };
  }
}

class NotificationModel {
  final int? id;
  final Sender? sender;
  final Recipient? recipient;
  final String? title;
  final String? message;
  final bool? isRead;
  final int? absentId;
  final String? dateRead;
  final String? dateSend;
  final String? createdAt;
  final int? absentType;

  NotificationModel({
    this.id,
    this.sender,
    this.recipient,
    this.title,
    this.message,
    this.isRead,
    this.absentId,
    this.dateRead,
    this.dateSend,
    this.createdAt,
    this.absentType,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      sender: json['sender'] != null ? Sender.fromJson(json['sender']) : null,
      recipient: json['recipient'] != null ? Recipient.fromJson(json['recipient']) : null,
      title: json['title'],
      message: json['message'],
      isRead: json['is_read'],
      absentId: json['absent_id'],
      dateRead: json['date_read'],
      dateSend: json['date_send'],
      createdAt: json['created_at'],
      absentType: json['absent_type'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender?.toJson(),
      'recipient': recipient?.toJson(),
      'title': title,
      'message': message,
      'is_read': isRead,
      'absent_id': absentId,
      'date_read': dateRead,
      'date_send': dateSend,
      'created_at': createdAt,
      'absent_type': absentType,
    };
  }
}
