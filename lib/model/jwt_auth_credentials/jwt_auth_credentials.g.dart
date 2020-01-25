// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jwt_auth_credentials.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JwtAuthCredentials _$JwtAuthCredentialsFromJson(Map<String, dynamic> json) {
  return JwtAuthCredentials(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    tokenType: json['tokenType'] as String,
    expiresIn: json['expiresIn'] as int,
  );
}

Map<String, dynamic> _$JwtAuthCredentialsToJson(JwtAuthCredentials instance) =>
    <String, dynamic>{
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
      'tokenType': instance.tokenType,
      'expiresIn': instance.expiresIn,
    };
