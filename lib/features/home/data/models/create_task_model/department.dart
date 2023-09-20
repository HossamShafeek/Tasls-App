class Department {
  int? id;
  String? name;
  dynamic manager;

  Department({this.id, this.name, this.manager});

  factory Department.fromJson(Map<String, dynamic> json) => Department(
        id: json['id'] as int?,
        name: json['name'] as String?,
        manager: json['manager'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'manager': manager,
      };
}
