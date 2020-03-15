// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class FavoritesState extends Equatable {
  const FavoritesState(this._type);

  factory FavoritesState.favoritesLoadingState() = FavoritesLoadingState;

  factory FavoritesState.favoritesReadyState(
      {@required List<String> favoritesIds,
      @required List<Poi> favorites}) = FavoritesReadyState;

  final _FavoritesState _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(FavoritesLoadingState) favoritesLoadingState,
      @required
          FutureOr<R> Function(FavoritesReadyState) favoritesReadyState}) {
    assert(() {
      if (favoritesLoadingState == null || favoritesReadyState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesState.FavoritesLoadingState:
        return favoritesLoadingState(this as FavoritesLoadingState);
      case _FavoritesState.FavoritesReadyState:
        return favoritesReadyState(this as FavoritesReadyState);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(FavoritesLoadingState) favoritesLoadingState,
      FutureOr<R> Function(FavoritesReadyState) favoritesReadyState,
      @required FutureOr<R> Function(FavoritesState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesState.FavoritesLoadingState:
        if (favoritesLoadingState == null) break;
        return favoritesLoadingState(this as FavoritesLoadingState);
      case _FavoritesState.FavoritesReadyState:
        if (favoritesReadyState == null) break;
        return favoritesReadyState(this as FavoritesReadyState);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(FavoritesLoadingState) favoritesLoadingState,
      FutureOr<void> Function(FavoritesReadyState) favoritesReadyState}) {
    assert(() {
      if (favoritesLoadingState == null && favoritesReadyState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesState.FavoritesLoadingState:
        if (favoritesLoadingState == null) break;
        return favoritesLoadingState(this as FavoritesLoadingState);
      case _FavoritesState.FavoritesReadyState:
        if (favoritesReadyState == null) break;
        return favoritesReadyState(this as FavoritesReadyState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class FavoritesLoadingState extends FavoritesState {
  const FavoritesLoadingState._()
      : super(_FavoritesState.FavoritesLoadingState);

  factory FavoritesLoadingState() {
    _instance ??= FavoritesLoadingState._();
    return _instance;
  }

  static FavoritesLoadingState _instance;
}

@immutable
class FavoritesReadyState extends FavoritesState {
  const FavoritesReadyState(
      {@required this.favoritesIds, @required this.favorites})
      : super(_FavoritesState.FavoritesReadyState);

  final List<String> favoritesIds;

  final List<Poi> favorites;

  @override
  String toString() =>
      'FavoritesReadyState(favoritesIds:${this.favoritesIds},favorites:${this.favorites})';
  @override
  List get props => [favoritesIds, favorites];
}
