import 'manager.dart';

class Datum {
  int? id;
  String? name;
  Manager? manager;

  Datum({this.id, this.name, this.manager});

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        name: json['name'] as String?,
        manager: json['manager'] == null
            ? Manager(
                name: 'Not Found',
                userType: 'No',
                phone: 000,
                email: 'No',
                id: 0,
                userCode: '0',
                status: 'No')
            : Manager.fromJson(json['manager'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'manager': manager?.toJson(),
      };
}
