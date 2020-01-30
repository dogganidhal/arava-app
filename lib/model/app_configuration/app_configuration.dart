import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/archipelago/archipelago.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/model/version_configuration/version_configuration.dart';
import 'package:meta/meta.dart';

@immutable
class AppConfiguration extends ApiConfiguration {
  @override
  final List<Archipelago> archipelagos;
  @override
  final List<PoiType> poiTypes;
  @override
  final VersionConfiguration versionConfiguration;
  final String preferredLocale;

  AppConfiguration({
    this.archipelagos, this.poiTypes, this.versionConfiguration,
    this.preferredLocale
  });

  factory AppConfiguration.fromApiConfiguration({
    ApiConfiguration apiConfiguration,
    String preferredLocale
  }) => AppConfiguration(
    archipelagos: apiConfiguration.archipelagos,
    poiTypes: apiConfiguration.poiTypes,
    versionConfiguration: apiConfiguration.versionConfiguration,
    preferredLocale: preferredLocale
  );

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = super.toJson();
    json['locale'] = preferredLocale;
    return json;
  }
}