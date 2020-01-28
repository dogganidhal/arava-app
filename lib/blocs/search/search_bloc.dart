import 'package:arava/blocs/search/event/search_event.dart';
import 'package:arava/blocs/search/state/search_state.dart';
import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  GoogleMapController _mapController;

  @override
  SearchState get initialState => SearchState(
    response: null,
    island: null
  );

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) => event.when(
    searchForPois: _searchForPois,
    selectIsland: _selectIsland,
    mapLoaded: _mapLoaded
  );

  void search(SearchForPois event) {
    add(event);
  }

  void mapLoaded(MapLoaded event) {
    add(event);
  }

  void selectIsland(SelectIsland event) {
    add(event);
  }

  Stream<SearchState> _searchForPois(SearchForPois event) async* {

  }

  Stream<SearchState> _selectIsland(SelectIsland event) async* {
    if (_mapController != null) {
      _mapController.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(event.island.center.latitude, event.island.center.longitude),
        event.island.zoom
      ));
    }
    yield state.copyWith(
      island: event.island
    );
  }

  Stream<SearchState> _mapLoaded(MapLoaded event) async* {
    _mapController = event.mapController;
  }
}