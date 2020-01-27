// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SearchEvent extends Equatable {
  const SearchEvent(this._type);

  factory SearchEvent.searchForPois({@required String query}) = SearchForPois;

  final _SearchEvent _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(SearchForPois) searchForPois}) {
    assert(() {
      if (searchForPois == null) throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchForPois:
        return searchForPois(this as SearchForPois);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(SearchForPois) searchForPois,
      @required FutureOr<R> Function(SearchEvent) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchForPois:
        if (searchForPois == null) break;
        return searchForPois(this as SearchForPois);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(SearchForPois) searchForPois}) {
    assert(() {
      if (searchForPois == null) throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _SearchEvent.SearchForPois:
        if (searchForPois == null) break;
        return searchForPois(this as SearchForPois);
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
