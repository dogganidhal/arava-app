// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent(this._type);

  factory FavoritesEvent.favoritesLoadEvent() = FavoritesLoadEvent;

  factory FavoritesEvent.favoritesTogglePoiEvent({@required Poi poi}) =
      FavoritesTogglePoiEvent;

  factory FavoritesEvent.favoritesSyncPoisEvent() = FavoritesSyncPoisEvent;

  final _FavoritesEvent _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(FavoritesLoadEvent) favoritesLoadEvent,
      @required R Function(FavoritesTogglePoiEvent) favoritesTogglePoiEvent,
      @required R Function(FavoritesSyncPoisEvent) favoritesSyncPoisEvent}) {
    assert(() {
      if (favoritesLoadEvent == null ||
          favoritesTogglePoiEvent == null ||
          favoritesSyncPoisEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesEvent.FavoritesLoadEvent:
        return favoritesLoadEvent(this as FavoritesLoadEvent);
      case _FavoritesEvent.FavoritesTogglePoiEvent:
        return favoritesTogglePoiEvent(this as FavoritesTogglePoiEvent);
      case _FavoritesEvent.FavoritesSyncPoisEvent:
        return favoritesSyncPoisEvent(this as FavoritesSyncPoisEvent);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required
          FutureOr<R> Function(FavoritesLoadEvent) favoritesLoadEvent,
      @required
          FutureOr<R> Function(FavoritesTogglePoiEvent) favoritesTogglePoiEvent,
      @required
          FutureOr<R> Function(FavoritesSyncPoisEvent)
              favoritesSyncPoisEvent}) {
    assert(() {
      if (favoritesLoadEvent == null ||
          favoritesTogglePoiEvent == null ||
          favoritesSyncPoisEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesEvent.FavoritesLoadEvent:
        return favoritesLoadEvent(this as FavoritesLoadEvent);
      case _FavoritesEvent.FavoritesTogglePoiEvent:
        return favoritesTogglePoiEvent(this as FavoritesTogglePoiEvent);
      case _FavoritesEvent.FavoritesSyncPoisEvent:
        return favoritesSyncPoisEvent(this as FavoritesSyncPoisEvent);
    }
  }

  R whenOrElse<R>(
      {R Function(FavoritesLoadEvent) favoritesLoadEvent,
      R Function(FavoritesTogglePoiEvent) favoritesTogglePoiEvent,
      R Function(FavoritesSyncPoisEvent) favoritesSyncPoisEvent,
      @required R Function(FavoritesEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesEvent.FavoritesLoadEvent:
        if (favoritesLoadEvent == null) break;
        return favoritesLoadEvent(this as FavoritesLoadEvent);
      case _FavoritesEvent.FavoritesTogglePoiEvent:
        if (favoritesTogglePoiEvent == null) break;
        return favoritesTogglePoiEvent(this as FavoritesTogglePoiEvent);
      case _FavoritesEvent.FavoritesSyncPoisEvent:
        if (favoritesSyncPoisEvent == null) break;
        return favoritesSyncPoisEvent(this as FavoritesSyncPoisEvent);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(FavoritesLoadEvent) favoritesLoadEvent,
      FutureOr<R> Function(FavoritesTogglePoiEvent) favoritesTogglePoiEvent,
      FutureOr<R> Function(FavoritesSyncPoisEvent) favoritesSyncPoisEvent,
      @required FutureOr<R> Function(FavoritesEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesEvent.FavoritesLoadEvent:
        if (favoritesLoadEvent == null) break;
        return favoritesLoadEvent(this as FavoritesLoadEvent);
      case _FavoritesEvent.FavoritesTogglePoiEvent:
        if (favoritesTogglePoiEvent == null) break;
        return favoritesTogglePoiEvent(this as FavoritesTogglePoiEvent);
      case _FavoritesEvent.FavoritesSyncPoisEvent:
        if (favoritesSyncPoisEvent == null) break;
        return favoritesSyncPoisEvent(this as FavoritesSyncPoisEvent);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(FavoritesLoadEvent) favoritesLoadEvent,
      FutureOr<void> Function(FavoritesTogglePoiEvent) favoritesTogglePoiEvent,
      FutureOr<void> Function(FavoritesSyncPoisEvent) favoritesSyncPoisEvent}) {
    assert(() {
      if (favoritesLoadEvent == null &&
          favoritesTogglePoiEvent == null &&
          favoritesSyncPoisEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _FavoritesEvent.FavoritesLoadEvent:
        if (favoritesLoadEvent == null) break;
        return favoritesLoadEvent(this as FavoritesLoadEvent);
      case _FavoritesEvent.FavoritesTogglePoiEvent:
        if (favoritesTogglePoiEvent == null) break;
        return favoritesTogglePoiEvent(this as FavoritesTogglePoiEvent);
      case _FavoritesEvent.FavoritesSyncPoisEvent:
        if (favoritesSyncPoisEvent == null) break;
        return favoritesSyncPoisEvent(this as FavoritesSyncPoisEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class FavoritesLoadEvent extends FavoritesEvent {
  const FavoritesLoadEvent._() : super(_FavoritesEvent.FavoritesLoadEvent);

  factory FavoritesLoadEvent() {
    _instance ??= const FavoritesLoadEvent._();
    return _instance;
  }

  static FavoritesLoadEvent _instance;
}

@immutable
class FavoritesTogglePoiEvent extends FavoritesEvent {
  const FavoritesTogglePoiEvent({@required this.poi})
      : super(_FavoritesEvent.FavoritesTogglePoiEvent);

  final Poi poi;

  @override
  String toString() => 'FavoritesTogglePoiEvent(poi:${this.poi})';
  @override
  List get props => [poi];
}

@immutable
class FavoritesSyncPoisEvent extends FavoritesEvent {
  const FavoritesSyncPoisEvent._()
      : super(_FavoritesEvent.FavoritesSyncPoisEvent);

  factory FavoritesSyncPoisEvent() {
    _instance ??= const FavoritesSyncPoisEvent._();
    return _instance;
  }

  static FavoritesSyncPoisEvent _instance;
}
