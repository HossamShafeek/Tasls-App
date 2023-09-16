class Data {
  String? token;
  String? username;
  String? email;
  String? userType;

  Data({this.token, this.username, this.email, this.userType});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json['token'] as String?,
        username: json['username'] as String?,
        email: json['email'] as String?,
        userType: json['user_type'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'token': token,
        'username': username,
        'email': email,
        'user_type': userType,
      };
}
