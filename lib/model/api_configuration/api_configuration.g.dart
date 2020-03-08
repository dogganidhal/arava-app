// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiConfiguration _$ApiConfigurationFromJson(Map<String, dynamic> json) {
  return ApiConfiguration(
    versionConfiguration: json['versionConfiguration'] == null
        ? null
        : VersionConfiguration.fromJson(
            json['versionConfiguration'] as Map<String, dynamic>),
    archipelagos: (json['archipelagos'] as List)
        ?.map((e) =>
            e == null ? null : Archipelago.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    poiTypes: (json['poiTypes'] as List)
        ?.map((e) =>
            e == null ? null : PoiTheme.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ApiConfigurationToJson(ApiConfiguration instance) =>
    <String, dynamic>{
      'versionConfiguration': instance.versionConfiguration,
      'archipelagos': instance.archipelagos,
      'poiTypes': instance.poiTypes,
    };
