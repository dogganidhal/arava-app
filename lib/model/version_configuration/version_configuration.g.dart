// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_configuration.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VersionConfiguration _$VersionConfigurationFromJson(Map<String, dynamic> json) {
  return VersionConfiguration(
    minVersion: json['minVersion'] as int,
    maxDate: json['maxDate'] == null
        ? null
        : DateTime.parse(json['maxDate'] as String),
    force: json['force'] as bool,
  );
}

Map<String, dynamic> _$VersionConfigurationToJson(
        VersionConfiguration instance) =>
    <String, dynamic>{
      'minVersion': instance.minVersion,
      'maxDate': instance.maxDate?.toIso8601String(),
      'force': instance.force,
    };
