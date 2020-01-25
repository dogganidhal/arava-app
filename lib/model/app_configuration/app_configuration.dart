import 'package:arava_app/model/api_configuration/api_configuration.dart';
import 'package:arava_app/model/island/island.dart';
import 'package:arava_app/model/poi_type/poi_type.dart';
import 'package:arava_app/model/version_configuration/version_configuration.dart';


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