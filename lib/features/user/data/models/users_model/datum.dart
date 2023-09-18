class Datum {
  int? id;
  String? userCode;
  String? name;
  String? email;
  int? phone;
  String? status;
  String? userType;

  Datum({
    this.id,
    this.userCode,
    this.name,
    this.email,
    this.phone,
    this.status,
    this.userType,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json['id'] as int?,
        userCode: json['user_code'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        phone: json['phone'] as int?,
        status: json['status'] as String?,
        userType: json['user_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'user_code': userCode,
        'name': name,
        'email': email,
        'phone': phone,
        'status': status,
        'user_type': userType,
      };
}
