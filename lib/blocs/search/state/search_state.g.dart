// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class SearchState extends Equatable {
  const SearchState(this._type);

  factory SearchState.search(
      {@required SearchResponse result,
      @required Island selectedIsland}) = Search;

  final _SearchState _type;

//ignore: missing_return
  FutureOr<R> when<R>({@required FutureOr<R> Function(Search) search}) {
    assert(() {
      if (search == null) throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _SearchState.Search:
        return search(this as Search);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(Search) search,
      @required FutureOr<R> Function(SearchState) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _SearchState.Search:
        if (search == null) break;
        return search(this as Search);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial({FutureOr<void> Function(Search) search}) {
    assert(() {
      if (search == null) throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _SearchState.Search:
        if (search == null) break;
        return search(this as Search);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Search extends SearchState {
  const Search({@required this.result, @required this.selectedIsland})
      : super(_SearchState.Search);

  final SearchResponse result;

  final Island selectedIsland;

  @override
  String toString() =>
      'Search(result:${this.result},selectedIsland:${this.selectedIsland})';
  @override
  List get props => [result, selectedIsland];
}
