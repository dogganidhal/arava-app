import 'package:arava/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatelessWidget {

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Map({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.terrain,
        initialCameraPosition: Map._kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          String brightness = MediaQuery.of(context).platformBrightness == Brightness.dark ?
            "dark" :
            "light";
          rootBundle.loadString("assets/map_styles/$brightness.json")
            .then((string) => controller.setMapStyle(string));
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(AppLocalizations.of(context).search_Filter()),
        icon: Icon(Icons.filter_list),
      ),
    );
  }

}