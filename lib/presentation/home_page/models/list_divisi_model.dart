class DepartmentResponse {
  final int status;
  final List<Department> details;

  DepartmentResponse({
    required this.status,
    required this.details,
  });

  factory DepartmentResponse.fromJson(Map<String, dynamic> json) {
    var detailsList = json['details'] as List;
    List<Department> details = detailsList.map((i) => Department.fromJson(i)).toList();

    return DepartmentResponse(
      status: json['status'],
      details: details,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> detailsList = this.details.map((i) => i.toJson()).toList();

    return {
      'status': status,
      'details': detailsList,
    };
  }
}

class Department {
  final int id;
  final String name;

  Department({
    required this.id,
    required this.name,
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
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
