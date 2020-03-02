import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:arava/model/update_profile_request/update_profile_request.dart';
import 'package:arava/model/user/user.dart';
import 'package:arava/service/dio_service.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class AuthService extends DioService {
  AuthService({@required Dio dio}) : super(dio: dio);

  Future<JwtAuthCredentials> login(String email, String password) async {
    final response = await post("/auth/login", data: {
      "email": email,
      "password": password
    });
    return JwtAuthCredentials.fromJson(response.data);
  }

  Future<JwtAuthCredentials> signUp({
    String email, String password,
    String firstName, String lastName
  }) async {
    final response = await post("/auth/signup", data: {
      "email": email,
      "password": password,
      "firstName": firstName,
      "lastName": lastName
    });
    return JwtAuthCredentials.fromJson(response.data);
  }

  Future<User> getUser() async {
    final response = await get("/user");
    return User.fromJson(response.data);
  }

  Future<void> updateProfile(UpdateProfileRequest request) async {
    return await put("/user", data: request.toJson());
  }
}