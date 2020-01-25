import 'package:json_annotation/json_annotation.dart';

part 'jwt_auth_credentials.g.dart';

@JsonSerializable()
class JwtAuthCredentials {

  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;

  JwtAuthCredentials({
    this.accessToken, this.refreshToken, this.tokenType, this.expiresIn
  });

  factory JwtAuthCredentials.fromJson(Map<String, dynamic> json) => _$JwtAuthCredentialsFromJson(json);
  Map<String, dynamic> toJson() => _$JwtAuthCredentialsToJson(this);

}