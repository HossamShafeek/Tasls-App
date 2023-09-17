import 'data.dart';

class UserModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  UserModel({this.message, this.data, this.status, this.code});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        status: json['status'] as bool?,
        code: json['code'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'data': data?.toJson(),
        'status': status,
        'code': code,
      };
}
