import 'package:arava/model/error_code/error_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_exception.g.dart';


@JsonSerializable()
class ApiException implements Exception {
  final ErrorCode errorCode;
  final int status;
  final String statusCode;
  final String path;
  final DateTime timestamp;

  ApiException({
    this.errorCode, this.status, this.statusCode, this.path, this.timestamp
  });


  factory ApiException.fromJson(Map<String, dynamic> json) => _$ApiExceptionFromJson(json);
  Map<String, dynamic> toJson() => _$ApiExceptionToJson(this);
}