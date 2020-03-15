import 'package:arava/model/poi/poi.dart';
import 'package:super_enum/super_enum.dart';

part 'favorites_event.g.dart';

@superEnum
enum _FavoritesEvent {
  @object
  FavoritesLoadEvent,
  @Data(fields: [
    DataField<Poi>('poi')
  ])
  FavoritesTogglePoiEvent,
  @object
  FavoritesSyncPoisEvent
}