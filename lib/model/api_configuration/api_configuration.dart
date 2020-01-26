import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/model/version_configuration/version_configuration.dart';
import 'package:json_annotation/json_annotation.dart';

part 'api_configuration.g.dart';

@JsonSerializable()
class ApiConfiguration {
  final VersionConfiguration versionConfiguration;
  final List<Island> islands;
  final List<PoiType> poiTypes;

  ApiConfiguration({
    this.versionConfiguration, this.islands, this.poiTypes
  });

  factory ApiConfiguration.fromJson(Map<String, dynamic> json) => _$ApiConfigurationFromJson(json);
  Map<String, dynamic> toJson() => _$ApiConfigurationToJson(this);
}