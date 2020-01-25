import 'package:json_annotation/json_annotation.dart';

part 'version_configuration.g.dart';

@JsonSerializable()
class VersionConfiguration {
  final int minVersion;
  final DateTime maxDate;
  final bool force;

  VersionConfiguration({
    this.minVersion, this.maxDate, this.force
  });

  factory VersionConfiguration.fromJson(Map<String, dynamic> json) => _$VersionConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$VersionConfigurationToJson(this);
}