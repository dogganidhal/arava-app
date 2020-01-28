// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent(this._type);

  factory SearchEvent.searchForPois({@required String query}) = SearchForPois;

  factory SearchEvent.selectIsland({@required Island island}) = SelectIsland;

  factory SearchEvent.mapLoaded({@required GoogleMapController mapController}) =
      MapLoaded;

  final _SearchEvent _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(SearchForPois) searchForPois,
      @required FutureOr<R> Function(SelectIsland) selectIsland,
      @required FutureOr<R> Function(MapLoaded) mapLoaded}) {
    assert(() {
      if (searchForPois == null || selectIsland == null || mapLoaded == null)
        throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchForPois:
        return searchForPois(this as SearchForPois);
      case _SearchEvent.SelectIsland:
        return selectIsland(this as SelectIsland);
      case _SearchEvent.MapLoaded:
        return mapLoaded(this as MapLoaded);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(SearchForPois) searchForPois,
      FutureOr<R> Function(SelectIsland) selectIsland,
      FutureOr<R> Function(MapLoaded) mapLoaded,
      @required FutureOr<R> Function(SearchEvent) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchForPois:
        if (searchForPois == null) break;
        return searchForPois(this as SearchForPois);
      case _SearchEvent.SelectIsland:
        if (selectIsland == null) break;
        return selectIsland(this as SelectIsland);
      case _SearchEvent.MapLoaded:
        if (mapLoaded == null) break;
        return mapLoaded(this as MapLoaded);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(SearchForPois) searchForPois,
      FutureOr<void> Function(SelectIsland) selectIsland,
      FutureOr<void> Function(MapLoaded) mapLoaded}) {
    assert(() {
      if (searchForPois == null && selectIsland == null && mapLoaded == null)
        throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchForPois:
        if (searchForPois == null) break;
        return searchForPois(this as SearchForPois);
      case _SearchEvent.SelectIsland:
        if (selectIsland == null) break;
        return selectIsland(this as SelectIsland);
      case _SearchEvent.MapLoaded:
        if (mapLoaded == null) break;
        return mapLoaded(this as MapLoaded);
    }
  }

  @override
  List get props => const [];
}

@immutable
class SearchForPois extends SearchEvent {
  const SearchForPois({@required this.query})
      : super(_SearchEvent.SearchForPois);

  final String query;

  @override
  String toString() => 'SearchForPois(query:${this.query})';
  @override
  List get props => [query];
}

@immutable
class SelectIsland extends SearchEvent {
  const SelectIsland({@required this.island})
      : super(_SearchEvent.SelectIsland);

  final Island island;

  @override
  String toString() => 'SelectIsland(island:${this.island})';
  @override
  List get props => [island];
}

@immutable
class MapLoaded extends SearchEvent {
  const MapLoaded({@required this.mapController})
      : super(_SearchEvent.MapLoaded);

  final GoogleMapController mapController;

  @override
  String toString() => 'MapLoaded(mapController:${this.mapController})';
  @override
  List get props => [mapController];
}
