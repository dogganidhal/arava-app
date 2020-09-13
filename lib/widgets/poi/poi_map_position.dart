import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PoiMapPosition extends StatefulWidget {
  final Poi poi;

  const PoiMapPosition({Key key, this.poi}) : super(key: key);

  @override
  _PoiMapPositionState createState() => _PoiMapPositionState();
}

class _PoiMapPositionState extends State<PoiMapPosition> with AutomaticKeepAliveClientMixin {
  final GlobalContextBloc _globalContextBloc = Modular.get<GlobalContextBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: AspectRatio(
        aspectRatio: 1,
        child: BlocBuilder<GlobalContextBloc, GlobalContextState>(
          bloc: _globalContextBloc,
          builder: (context, globalContext) => Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
              borderRadius: BorderRadius.circular(4),
            ),
            child: GoogleMap(
              liteModeEnabled: true,
              initialCameraPosition: _initialCameraPosition,
              mapToolbarEnabled: false,
              markers: [
                Marker(
                  markerId: MarkerId(widget.poi.id),
                  icon: _iconForPoi(globalContext, widget.poi),
                  position: LatLng(widget.poi.coordinate.latitude, widget.poi.coordinate.longitude)
                ),
              ].toSet(),
              onMapCreated: (controller) {
              },
            ),
          ),
        ),
      ),
    );
  }

  CameraPosition get _initialCameraPosition => CameraPosition(
    target: LatLng(widget.poi.coordinate.latitude, widget.poi.coordinate.longitude),
    zoom: 12,
  );

  BitmapDescriptor _iconForPoi(GlobalContextState globalContext, Poi poi) {
    final pinsMap = globalContext.configuration.pinsMap;
    final sponsoredPinsMap = globalContext.configuration.sponsoredPinsMap;
    if (poi.sponsored) {
      return sponsoredPinsMap.containsKey(poi.theme.id) ?
      sponsoredPinsMap[poi.theme.id] :
      globalContext.configuration.defaultSponsoredPinBitmapDescriptor;
    }
    return pinsMap.containsKey(poi.theme.id) ?
    pinsMap[poi.theme.id] :
    globalContext.configuration.defaultPinBitmapDescriptor;
  }
}