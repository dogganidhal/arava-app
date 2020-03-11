import 'package:arava/model/island/island.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/search_filters/search_filters.dart';
import 'package:arava/model/search_request/search_request.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' show CameraPosition, GoogleMapController;
import 'package:super_enum/super_enum.dart';

part 'search_event.g.dart';

@superEnum
enum _SearchEvent {
  @object
  SearchSubmitEvent,
  @Data(fields: [
    DataField<Island>('island')
  ])
  SearchSelectIslandEvent,
  @Data(fields: [
    DataField<GoogleMapController>('mapController')
  ])
  SearchMapLoadedEvent,
  @Data(fields: [
    DataField<SearchRequest>('request')
  ])
  SearchUpdateRequestEvent,
  @Data(fields: [
    DataField<CameraPosition>('cameraPosition')
  ])
  SearchCameraPositionUpdatedEvent,
  @Data(fields: [
    DataField<Poi>('poi')
  ])
  SearchSelectPoiEvent,
  @Data(fields: [
    DataField<SearchFilters>('searchFilters')
  ])
  SearchSetFiltersEvent
}