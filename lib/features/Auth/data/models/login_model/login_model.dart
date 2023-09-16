import 'data.dart';

class LoginModel {
  String? message;
  Data? data;
  bool? status;
  int? code;

  LoginModel({this.message, this.data, this.status, this.code});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
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
