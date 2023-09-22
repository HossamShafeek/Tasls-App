import 'employee.dart';
import 'manager.dart';

class Department {
  int? id;
  String? name;
  Manager? manager;
  List<Employee>? employees;

  Department({this.id, this.name, this.manager, this.employees});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json['id'] as int?,
        name: json['name'] as String?,
        manager: json['manager'] == null
            ? null
            : Manager.fromJson(json['manager'] as Map<String, dynamic>),
        employees: (json['employees'] as List<dynamic>?)
            ?.map((e) => Employee.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'manager': manager?.toJson(),
        'employees': employees?.map((e) => e.toJson()).toList(),
      };
}
