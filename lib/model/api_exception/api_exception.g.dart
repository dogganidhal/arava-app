// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiException _$ApiExceptionFromJson(Map<String, dynamic> json) {
  return ApiException(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['errorCode']),
    status: json['status'] as int,
    statusCode: json['statusCode'] as String,
    path: json['path'] as String,
    timestamp: json['timestamp'] == null
        ? null
        : DateTime.parse(json['timestamp'] as String),
  );
}

Map<String, dynamic> _$ApiExceptionToJson(ApiException instance) =>
    <String, dynamic>{
      'errorCode': _$ErrorCodeEnumMap[instance.errorCode],
      'status': instance.status,
      'statusCode': instance.statusCode,
      'path': instance.path,
      'timestamp': instance.timestamp?.toIso8601String(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ErrorCodeEnumMap = {
  ErrorCode.AUTH_USER_EXISTS: 'AUTH_USER_EXISTS',
  ErrorCode.AUTH_BAD_CREDENTIALS: 'AUTH_BAD_CREDENTIALS',
  ErrorCode.AUTH_MISSING_CREDENTIALS: 'AUTH_MISSING_CREDENTIALS',
  ErrorCode.AUTH_UNAUTHORIZED: 'AUTH_UNAUTHORIZED',
  ErrorCode.POI_NOT_FOUND: 'POI_NOT_FOUND',
  ErrorCode.ISLAND_NOT_FOUND: 'ISLAND_NOT_FOUND',
  ErrorCode.ISLAND_VALIDATION_FAILED: 'ISLAND_VALIDATION_FAILED',
  ErrorCode.ARCHIPELAGO_NOT_FOUND: 'ARCHIPELAGO_NOT_FOUND',
  ErrorCode.THEME_NOT_FOUND: 'THEME_NOT_FOUND',
  ErrorCode.RESOURCE_NOT_FOUND: 'RESOURCE_NOT_FOUND',
  ErrorCode.GENERAL_INTERNAL_SERVER_ERROR: 'GENERAL_INTERNAL_SERVER_ERROR',
  ErrorCode.GENERAL_VALIDATION_ERROR: 'GENERAL_VALIDATION_ERROR',
};
