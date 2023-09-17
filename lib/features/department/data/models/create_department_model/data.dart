class Data {
  int? id;
  String? name;
  dynamic manager;

  Data({this.id, this.name, this.manager});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
