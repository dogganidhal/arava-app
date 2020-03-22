import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/search/event/search_event.dart';
import 'package:arava/blocs/search/state/search_state.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/island/island.dart';
import 'package:arava/model/lat_lng/lat_lng.dart' as model;
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/region/region.dart';
import 'package:arava/model/search_filters/search_filters.dart';
import 'package:arava/model/search_request/search_request.dart';
import 'package:arava/service/poi_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final AppBloc appBloc;
  final GlobalContextBloc globalContextBloc;
  final PoiService poiService;

  GoogleMapController _mapController;
  LatLngBounds _lastVisibleRegion;
  bool _ignoreNextCameraUpdate = true;

  SearchBloc({@required this.appBloc, @required this.poiService, @required this.globalContextBloc});

  @override
  SearchState get initialState => SearchState(
    request: SearchRequest(
      sponsored: true
    )
  );

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) => event.when(
    searchSubmitEvent: _submit,
    searchSelectIslandEvent: _selectIsland,
    searchMapLoadedEvent: _mapLoaded,
    searchCameraPositionUpdatedEvent: _cameraUpdated,
    searchSelectPoiEvent: _selectPoi,
    searchSetFiltersEvent: _setSearchFilters
  );

  void search() {
    add(SearchEvent.searchSubmitEvent());
  }

  void mapLoaded(GoogleMapController googleMapController) {
    add(SearchEvent.searchMapLoadedEvent(
      mapController: googleMapController
    ));
  }

  void selectIsland(Island island) {
    add(SearchEvent.searchSelectIslandEvent(island: island));
  }

  void selectPoi(Poi poi) {
    add(SearchEvent.searchSelectPoiEvent(poi: poi));
  }

  void clearSelectedPoi() {
    add(SearchEvent.searchSelectPoiEvent(poi: null));
  }

  void setSearchFilters(SearchFilters searchFilters) {
    add(SearchEvent.searchSetFiltersEvent(searchFilters: searchFilters));
    add(SearchEvent.searchSubmitEvent());
  }

  void cameraIdle() async {
    if (_mapController != null) {
      final cameraPosition = await _mapController.getVisibleRegion();
      add(SearchEvent.searchCameraPositionUpdatedEvent(cameraPosition: cameraPosition));
    }
  }

  Stream<SearchState> _selectPoi(SearchSelectPoiEvent event) async* {
    yield state.withSelectedPoi(event.poi);
  }

  Stream<SearchState> _submit(SearchSubmitEvent event) async* {
    _ignoreNextCameraUpdate = true;
    yield state
      .withRegionDidChange(false)
      .withLoading(true)
      .withResponse(null)
      .withEmptyResult(false)
      .withSelectedPoi(null);
    try {
      final searchResponse = await poiService.search(state.request);
      yield state
        .withLoading(false)
        .withRegionDidChange(false)
        .withEmptyResult(searchResponse.count == 0)
        .withResponse(searchResponse);
      if (searchResponse.count > 0) {
        _mapController.animateCamera(CameraUpdate.newLatLngBounds(
          _boundsContainingPois(searchResponse.pois), 128
        ));
      }
    } on AppException catch (exception) {
      yield state
        .withLoading(false)
        .withRegionDidChange(false)
        .withException(exception);
    }
  }

  Stream<SearchState> _selectIsland(SearchSelectIslandEvent event) async* {
    globalContextBloc.updateSelectedIsland(event.island);
    yield state
      .withIsland(event.island)
      .withEmptyResult(false)
      .withRequest(state.request
        .withIsland(event.island.id)
      );
    _mapController.animateCamera(CameraUpdate.newLatLngZoom(
      LatLng(event.island.center.latitude, event.island.center.longitude),
      event.island.zoom
    ));
    add(SearchEvent.searchSubmitEvent());
  }

  Stream<SearchState> _mapLoaded(SearchMapLoadedEvent event) async* {
    _mapController = event.mapController;
  }

  Stream<SearchState> _cameraUpdated(SearchCameraPositionUpdatedEvent event) async* {
    if (!_ignoreNextCameraUpdate) {
      yield state
        .withRegionDidChange(_lastVisibleRegion != event.cameraPosition)
        .withRequest(state.request
          .withRegion(Region(
            southWest: model.LatLng(
              latitude: event.cameraPosition.southwest.latitude,
              longitude: event.cameraPosition.southwest.longitude
            ),
            northEast: model.LatLng(
              latitude: event.cameraPosition.northeast.latitude,
              longitude: event.cameraPosition.northeast.longitude
            )
          ))
        );
      _lastVisibleRegion = event.cameraPosition;
    }
    _ignoreNextCameraUpdate = false;
  }

  Stream<SearchState> _setSearchFilters(SearchSetFiltersEvent event) async* {
    yield state
      .withRequest(state.request
        .withSort(event.searchFilters.sort)
        .withThemeIds(event.searchFilters.themeIds)
        .withTitle(event.searchFilters.query)
        .withSponsored(event.searchFilters.sponsored)
      );
  }

  LatLngBounds _boundsContainingPois(List<Poi> pois) {
    final west = pois
      .reduce((lhs, rhs) => lhs.coordinate.longitude < rhs.coordinate.longitude ? lhs : rhs)
      .coordinate
      .longitude;
    final east = pois
      .reduce((lhs, rhs) => lhs.coordinate.longitude > rhs.coordinate.longitude ? lhs : rhs)
      .coordinate
      .longitude;
    final south = pois
      .reduce((lhs, rhs) => lhs.coordinate.latitude < rhs.coordinate.latitude ? lhs : rhs)
      .coordinate
      .latitude;
    final north = pois
      .reduce((lhs, rhs) => lhs.coordinate.latitude > rhs.coordinate.latitude ? lhs : rhs)
      .coordinate
      .latitude;
    return LatLngBounds(
      southwest: LatLng(south, west),
      northeast: LatLng(north, east),
    );
  }
}