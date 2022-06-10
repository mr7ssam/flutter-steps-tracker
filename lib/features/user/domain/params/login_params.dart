import 'package:core/core.dart';

class LoginParams extends Params {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});

  @override
  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory LoginParams.fromMap(Map<String, dynamic> map) {
    return LoginParams(
      email: map['email'] as String,
      password: map['password'] as String,
    );
  }
}
