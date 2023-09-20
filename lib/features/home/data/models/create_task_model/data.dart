import 'creator.dart';
import 'department.dart';
import 'employee.dart';

class Data {
  int? id;
  String? name;
  String? description;
  String? photo;
  String? status;
  String? startDate;
  String? endDate;
  Creator? creator;
  Department? department;
  Employee? employee;

  Data({
    this.id,
    this.name,
    this.description,
    this.photo,
    this.status,
    this.startDate,
    this.endDate,
    this.creator,
    this.department,
    this.employee,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        photo: json['photo'] as String?,
        status: json['status'] as String?,
        startDate: json['start date'] as String?,
        endDate: json['end date'] as String?,
        creator: json['creator'] == null
            ? null
            : Creator.fromJson(json['creator'] as Map<String, dynamic>),
        department: json['department'] == null
            ? null
            : Department.fromJson(json['department'] as Map<String, dynamic>),
        employee: json['employee'] == null
            ? null
            : Employee.fromJson(json['employee'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'photo': photo,
        'status': status,
        'start date': startDate,
        'end date': endDate,
        'creator': creator?.toJson(),
        'department': department?.toJson(),
        'employee': employee?.toJson(),
      };
}
