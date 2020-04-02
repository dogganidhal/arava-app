import 'package:arava/model/api_configuration/api_configuration.dart';
import 'package:arava/model/archipelago/archipelago.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/model/version_configuration/version_configuration.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

@immutable
class AppConfiguration extends ApiConfiguration {
  @override
  final List<Archipelago> archipelagos;
  @override
  final List<PoiTheme> themes;
  @override
  final VersionConfiguration versionConfiguration;
  final String preferredLocale;
  final BitmapDescriptor defaultPinBitmapDescriptor;
  final BitmapDescriptor defaultSponsoredPinBitmapDescriptor;
  final Map<String, BitmapDescriptor> pinsMap;
  final Map<String, BitmapDescriptor> sponsoredPinsMap;

  AppConfiguration({
    this.archipelagos, this.themes, this.versionConfiguration,
    this.preferredLocale, this.defaultPinBitmapDescriptor,
    this.defaultSponsoredPinBitmapDescriptor,
    this.pinsMap, this.sponsoredPinsMap
  });

  factory AppConfiguration.fromApiConfiguration({
    ApiConfiguration apiConfiguration,
    String preferredLocale,
    BitmapDescriptor defaultPinBitmapDescriptor,
    BitmapDescriptor defaultSponsoredPinBitmapDescriptor,
    Map<String, BitmapDescriptor> pinsMap,
    Map<String, BitmapDescriptor> sponsoredPinsMap
  }) => AppConfiguration(
    archipelagos: apiConfiguration.archipelagos,
    themes: apiConfiguration.themes,
    versionConfiguration: apiConfiguration.versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withArchipelagos(List<Archipelago> archipelagos) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withThemes(List<PoiTheme> themes) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withVersionConfiguration(VersionConfiguration versionConfiguration) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withPreferredLocale(String preferredLocale) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withPinBitmapDescriptor(BitmapDescriptor defaultPinBitmapDescriptor) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withSponsoredPinBitmapDescriptor(BitmapDescriptor defaultSponsoredPinBitmapDescriptor) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withPinsMap(Map<String, BitmapDescriptor> pinsMap) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );

  AppConfiguration withSponsoredPinsMap(Map<String, BitmapDescriptor> sponsoredPinsMap) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    defaultPinBitmapDescriptor: defaultPinBitmapDescriptor,
    defaultSponsoredPinBitmapDescriptor: defaultSponsoredPinBitmapDescriptor,
    pinsMap: pinsMap,
    sponsoredPinsMap: sponsoredPinsMap
  );
}