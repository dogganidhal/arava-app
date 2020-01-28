import 'package:arava/model/island/island.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:super_enum/super_enum.dart';

part 'search_event.g.dart';

@superEnum
enum _SearchEvent {
  @Data(fields: [
    DataField('query', String)
  ])
  SearchForPois,
  @Data(fields: [
    DataField('island', Island)
  ])
  SelectIsland,
  @Data(fields: [
    DataField('mapController', GoogleMapController)
  ])
  MapLoaded
}