import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatelessWidget {

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Map({Key key}) : super(key: key);

  final GoogleMap _map = GoogleMap(
    mapType: MapType.terrain,
    initialCameraPosition: Map._kGooglePlex,
    onMapCreated: (GoogleMapController controller) {

    },
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _map,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

}