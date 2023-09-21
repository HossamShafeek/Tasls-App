import 'employee.dart';
import 'manager.dart';

class Datum {
  int? id;
  String? name;
  Manager? manager;
  List<Employee>? employees;

  Datum({this.id, this.name, this.manager, this.employees});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        manager: json['manager'] == null
            ? Manager(departmentId: 0,status: 'No',userCode: 'No',id: 0,email: 'No',phone: 0,userType:'No',name: 'No')
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
