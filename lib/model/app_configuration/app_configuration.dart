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
  final BitmapDescriptor pinBitmapDescriptor;
  final BitmapDescriptor sponsoredPinBitmapDescriptor;

  AppConfiguration({
    this.archipelagos, this.themes, this.versionConfiguration,
    this.preferredLocale, this.pinBitmapDescriptor,
    this.sponsoredPinBitmapDescriptor
  });

  factory AppConfiguration.fromApiConfiguration({
    ApiConfiguration apiConfiguration,
    String preferredLocale,
    BitmapDescriptor pinBitmapDescriptor,
    BitmapDescriptor sponsoredPinBitmapDescriptor
  }) => AppConfiguration(
    archipelagos: apiConfiguration.archipelagos,
    themes: apiConfiguration.themes,
    versionConfiguration: apiConfiguration.versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );

  AppConfiguration withArchipelagos(List<Archipelago> archipelagos) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );

  AppConfiguration withThemes(List<PoiTheme> themes) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );

  AppConfiguration withVersionConfiguration(VersionConfiguration versionConfiguration) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );

  AppConfiguration withPreferredLocale(String preferredLocale) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );

  AppConfiguration withPinBitmapDescriptor(BitmapDescriptor pinBitmapDescriptor) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );

  AppConfiguration withSponsoredPinBitmapDescriptor(BitmapDescriptor sponsoredPinBitmapDescriptor) => AppConfiguration(
    archipelagos: archipelagos,
    themes: themes,
    versionConfiguration: versionConfiguration,
    preferredLocale: preferredLocale,
    pinBitmapDescriptor: pinBitmapDescriptor,
    sponsoredPinBitmapDescriptor: sponsoredPinBitmapDescriptor
  );
}