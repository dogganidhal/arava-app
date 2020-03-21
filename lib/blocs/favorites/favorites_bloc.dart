import 'package:arava/blocs/favorites/event/favorites_event.dart';
import 'package:arava/blocs/favorites/state/favorites_state.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/service/poi_service.dart';
import 'package:arava/service/session.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class FavoritesBloc extends Bloc<FavoritesEvent, FavoritesState> {
  final PoiService poiService;
  final Session session;

  FavoritesBloc({
    @required this.poiService,
    @required this.session
  });

  @override
  FavoritesState get initialState => FavoritesState.favoritesLoadingState();

  @override
  Stream<FavoritesState> mapEventToState(FavoritesEvent event) => event.when(
    favoritesLoadEvent: _loadFavorites,
    favoritesTogglePoiEvent: _toggleFavorite,
    favoritesSyncPoisEvent: _syncFavorites
  );

  void loadFavorites() {
    add(FavoritesEvent.favoritesLoadEvent());
  }

  void toggleFavorite(Poi poi) {
    add(FavoritesEvent.favoritesTogglePoiEvent(poi: poi));
  }

  void syncFavorites() {
    add(FavoritesEvent.favoritesSyncPoisEvent());
  }

  Stream<FavoritesState> _loadFavorites(FavoritesLoadEvent event) async* {
    yield FavoritesState.favoritesLoadingState();
    final user = await session.getUser();
    List<Poi> favorites = [];
    List<String> favoritesIds = [];
    if (user != null) {
      favorites = await poiService.getFavorites();
    } else {
      favorites = await session.getFavorites();
    }
    favoritesIds = favorites
      .map((poi) => poi.id)
      .toList();
    yield FavoritesState.favoritesReadyState(
      favoritesIds: favoritesIds,
      favorites: favorites
    );
  }

  Stream<FavoritesState> _toggleFavorite(FavoritesTogglePoiEvent event) async* {
    if (state is FavoritesReadyState) {
      final readyState = (state as FavoritesReadyState);
      List<Poi> favorites = await session.getFavorites();
      List<String> favoritesIds = List.from(readyState.favoritesIds);
      if (favoritesIds.contains(event.poi.id)) {
        favoritesIds.remove(event.poi.id);
        favorites.removeWhere((poi) => poi.id == event.poi.id);
      } else {
        favoritesIds = [
          ...readyState.favoritesIds,
          event.poi.id
        ];
        favorites = [
          ...favorites,
          event.poi
        ];
      }
      await session.setFavorites(favorites);
      yield FavoritesState.favoritesReadyState(
        favoritesIds: favoritesIds,
        favorites: favorites
      );
      final user = await session.getUser();
      if (user != null) {
        await poiService.syncFavorites(favorites);
      }
    }
  }

  Stream<FavoritesState> _syncFavorites(FavoritesSyncPoisEvent event) async* {
    final favorites = await session.getFavorites();
    await poiService.syncFavorites(favorites);
  }
}