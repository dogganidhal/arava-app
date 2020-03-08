// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent(this._type);

  factory SearchEvent.searchSubmitEvent() = SearchSubmitEvent;

  factory SearchEvent.searchSelectIslandEvent({@required Island island}) =
      SearchSelectIslandEvent;

  factory SearchEvent.searchMapLoadedEvent(
      {@required GoogleMapController mapController}) = SearchMapLoadedEvent;

  factory SearchEvent.searchUpdateRequestEvent(
      {@required SearchRequest request}) = SearchUpdateRequestEvent;

  factory SearchEvent.searchCameraPositionUpdatedEvent(
          {@required CameraPosition cameraPosition}) =
      SearchCameraPositionUpdatedEvent;

  factory SearchEvent.searchSelectPoiEvent({@required Poi poi}) =
      SearchSelectPoiEvent;

  final _SearchEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(SearchSubmitEvent) searchSubmitEvent,
      @required
          FutureOr<R> Function(SearchSelectIslandEvent) searchSelectIslandEvent,
      @required
          FutureOr<R> Function(SearchMapLoadedEvent) searchMapLoadedEvent,
      @required
          FutureOr<R> Function(SearchUpdateRequestEvent)
              searchUpdateRequestEvent,
      @required
          FutureOr<R> Function(SearchCameraPositionUpdatedEvent)
              searchCameraPositionUpdatedEvent,
      @required
          FutureOr<R> Function(SearchSelectPoiEvent) searchSelectPoiEvent}) {
    assert(() {
      if (searchSubmitEvent == null ||
          searchSelectIslandEvent == null ||
          searchMapLoadedEvent == null ||
          searchUpdateRequestEvent == null ||
          searchCameraPositionUpdatedEvent == null ||
          searchSelectPoiEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchSubmitEvent:
        return searchSubmitEvent(this as SearchSubmitEvent);
      case _SearchEvent.SearchSelectIslandEvent:
        return searchSelectIslandEvent(this as SearchSelectIslandEvent);
      case _SearchEvent.SearchMapLoadedEvent:
        return searchMapLoadedEvent(this as SearchMapLoadedEvent);
      case _SearchEvent.SearchUpdateRequestEvent:
        return searchUpdateRequestEvent(this as SearchUpdateRequestEvent);
      case _SearchEvent.SearchCameraPositionUpdatedEvent:
        return searchCameraPositionUpdatedEvent(
            this as SearchCameraPositionUpdatedEvent);
      case _SearchEvent.SearchSelectPoiEvent:
        return searchSelectPoiEvent(this as SearchSelectPoiEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(SearchSubmitEvent) searchSubmitEvent,
      FutureOr<R> Function(SearchSelectIslandEvent) searchSelectIslandEvent,
      FutureOr<R> Function(SearchMapLoadedEvent) searchMapLoadedEvent,
      FutureOr<R> Function(SearchUpdateRequestEvent) searchUpdateRequestEvent,
      FutureOr<R> Function(SearchCameraPositionUpdatedEvent)
          searchCameraPositionUpdatedEvent,
      FutureOr<R> Function(SearchSelectPoiEvent) searchSelectPoiEvent,
      @required FutureOr<R> Function(SearchEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchSubmitEvent:
        if (searchSubmitEvent == null) break;
        return searchSubmitEvent(this as SearchSubmitEvent);
      case _SearchEvent.SearchSelectIslandEvent:
        if (searchSelectIslandEvent == null) break;
        return searchSelectIslandEvent(this as SearchSelectIslandEvent);
      case _SearchEvent.SearchMapLoadedEvent:
        if (searchMapLoadedEvent == null) break;
        return searchMapLoadedEvent(this as SearchMapLoadedEvent);
      case _SearchEvent.SearchUpdateRequestEvent:
        if (searchUpdateRequestEvent == null) break;
        return searchUpdateRequestEvent(this as SearchUpdateRequestEvent);
      case _SearchEvent.SearchCameraPositionUpdatedEvent:
        if (searchCameraPositionUpdatedEvent == null) break;
        return searchCameraPositionUpdatedEvent(
            this as SearchCameraPositionUpdatedEvent);
      case _SearchEvent.SearchSelectPoiEvent:
        if (searchSelectPoiEvent == null) break;
        return searchSelectPoiEvent(this as SearchSelectPoiEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(SearchSubmitEvent) searchSubmitEvent,
      FutureOr<void> Function(SearchSelectIslandEvent) searchSelectIslandEvent,
      FutureOr<void> Function(SearchMapLoadedEvent) searchMapLoadedEvent,
      FutureOr<void> Function(SearchUpdateRequestEvent)
          searchUpdateRequestEvent,
      FutureOr<void> Function(SearchCameraPositionUpdatedEvent)
          searchCameraPositionUpdatedEvent,
      FutureOr<void> Function(SearchSelectPoiEvent) searchSelectPoiEvent}) {
    assert(() {
      if (searchSubmitEvent == null &&
          searchSelectIslandEvent == null &&
          searchMapLoadedEvent == null &&
          searchUpdateRequestEvent == null &&
          searchCameraPositionUpdatedEvent == null &&
          searchSelectPoiEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchSubmitEvent:
        if (searchSubmitEvent == null) break;
        return searchSubmitEvent(this as SearchSubmitEvent);
      case _SearchEvent.SearchSelectIslandEvent:
        if (searchSelectIslandEvent == null) break;
        return searchSelectIslandEvent(this as SearchSelectIslandEvent);
      case _SearchEvent.SearchMapLoadedEvent:
        if (searchMapLoadedEvent == null) break;
        return searchMapLoadedEvent(this as SearchMapLoadedEvent);
      case _SearchEvent.SearchUpdateRequestEvent:
        if (searchUpdateRequestEvent == null) break;
        return searchUpdateRequestEvent(this as SearchUpdateRequestEvent);
      case _SearchEvent.SearchCameraPositionUpdatedEvent:
        if (searchCameraPositionUpdatedEvent == null) break;
        return searchCameraPositionUpdatedEvent(
            this as SearchCameraPositionUpdatedEvent);
      case _SearchEvent.SearchSelectPoiEvent:
        if (searchSelectPoiEvent == null) break;
        return searchSelectPoiEvent(this as SearchSelectPoiEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class SearchSubmitEvent extends SearchEvent {
  const SearchSubmitEvent._() : super(_SearchEvent.SearchSubmitEvent);

  factory SearchSubmitEvent() {
    _instance ??= SearchSubmitEvent._();
    return _instance;
  }

  static SearchSubmitEvent _instance;
}

@immutable
class SearchSelectIslandEvent extends SearchEvent {
  const SearchSelectIslandEvent({@required this.island})
      : super(_SearchEvent.SearchSelectIslandEvent);

  final Island island;

  @override
  String toString() => 'SearchSelectIslandEvent(island:${this.island})';
  @override
  List get props => [island];
}

@immutable
class SearchMapLoadedEvent extends SearchEvent {
  const SearchMapLoadedEvent({@required this.mapController})
      : super(_SearchEvent.SearchMapLoadedEvent);

  final GoogleMapController mapController;

  @override
  String toString() =>
      'SearchMapLoadedEvent(mapController:${this.mapController})';
  @override
  List get props => [mapController];
}

@immutable
class SearchUpdateRequestEvent extends SearchEvent {
  const SearchUpdateRequestEvent({@required this.request})
      : super(_SearchEvent.SearchUpdateRequestEvent);

  final SearchRequest request;

  @override
  String toString() => 'SearchUpdateRequestEvent(request:${this.request})';
  @override
  List get props => [request];
}

@immutable
class SearchCameraPositionUpdatedEvent extends SearchEvent {
  const SearchCameraPositionUpdatedEvent({@required this.cameraPosition})
      : super(_SearchEvent.SearchCameraPositionUpdatedEvent);

  final CameraPosition cameraPosition;

  @override
  String toString() =>
      'SearchCameraPositionUpdatedEvent(cameraPosition:${this.cameraPosition})';
  @override
  List get props => [cameraPosition];
}

@immutable
class SearchSelectPoiEvent extends SearchEvent {
  const SearchSelectPoiEvent({@required this.poi})
      : super(_SearchEvent.SearchSelectPoiEvent);

  final Poi poi;

  @override
  String toString() => 'SearchSelectPoiEvent(poi:${this.poi})';
  @override
  List get props => [poi];
}
