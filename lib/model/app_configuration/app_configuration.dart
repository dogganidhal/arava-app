import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/model/version_configuration/version_configuration.dart';
import 'package:meta/meta.dart';

@immutable
class AppConfiguration extends ApiConfiguration {
  @override
  final List<Island> islands;
  @override
  final List<PoiType> poiTypes;
  @override
  final VersionConfiguration versionConfiguration;
  final String preferredLocale;

  AppConfiguration({
    this.islands, this.poiTypes, this.versionConfiguration,
    this.preferredLocale
  });

  factory AppConfiguration.fromApiConfiguration({
    ApiConfiguration apiConfiguration,
    String preferredLocale
  }) => AppConfiguration(
    islands: apiConfiguration.islands,
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