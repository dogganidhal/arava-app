import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:arava/model/user/user.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class AuthService {
  final Dio dio;

  AuthService({@required this.dio});

  Future<JwtAuthCredentials> login(String email, String password) async {
    final response = await dio.post("/auth/login", data: {
      email: email,
      password: password
    });
    return JwtAuthCredentials.fromJson(response.data);
  }

  Future<User> getUser() async {
    final response = await dio.get("/user");
    return User.fromJson(response.data);
  }
}