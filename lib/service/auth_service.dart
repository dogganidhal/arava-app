import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:dio/dio.dart';


class AuthService {
  final Dio dio;

  AuthService(this.dio);

  Future<JwtAuthCredentials> login(String email, String password) async {
    final response = await dio.post<JwtAuthCredentials>("/auth/login", data: {
      email: email,
      password: password
    });
    return response.data;
  }

}