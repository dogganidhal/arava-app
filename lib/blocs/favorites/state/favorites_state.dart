import 'package:arava/model/poi/poi.dart';
import 'package:super_enum/super_enum.dart';

part 'favorites_state.g.dart';

@superEnum
enum _FavoritesState {
  @object
  FavoritesLoadingState,
  @Data(fields: [
    DataField<List<String>>('favoritesIds'),
    DataField<List<Poi>>('favorites')
  ])
  FavoritesReadyState
}