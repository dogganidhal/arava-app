import 'package:arava/model/archipelago/archipelago.dart';
import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/model/version_configuration/version_configuration.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'api_configuration.g.dart';

@JsonSerializable()
@immutable
class ApiConfiguration {
  final VersionConfiguration versionConfiguration;
  final List<Archipelago> archipelagos;
  final List<PoiTheme> themes;

  ApiConfiguration({
    this.versionConfiguration, this.archipelagos, this.themes
  });

  factory ApiConfiguration.fromJson(Map<String, dynamic> json) => _$ApiConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$ApiConfigurationToJson(this);
}