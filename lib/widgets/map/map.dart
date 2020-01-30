import 'package:arava/blocs/search/event/search_event.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/modules/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class Map extends StatefulWidget {

  Map({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _Map();

}


class _Map extends ModularState<Map, AppModule> with AutomaticKeepAliveClientMixin {

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          get<SearchBloc>()
            .mapLoaded(SearchEvent.mapLoaded(mapController: controller));
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

  @override
  bool get wantKeepAlive => true;

}