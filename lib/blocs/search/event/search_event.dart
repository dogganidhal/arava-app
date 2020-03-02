import 'package:arava/model/island/island.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:super_enum/super_enum.dart';

part 'search_event.g.dart';

@superEnum
enum _SearchEvent {
  @Data(fields: [
    DataField<String>('query')
  ])
  SearchForPois,
  @Data(fields: [
    DataField<Island>('island')
  ])
  SelectIsland,
  @Data(fields: [
    DataField<GoogleMapController>('mapController')
  ])
  MapLoaded
}