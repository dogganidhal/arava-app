import 'package:arava/model/search_response/search_response.dart';
import 'package:arava/model/island/island.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class SearchState extends Equatable  {
  final SearchResponse response;
  final Island island;

  SearchState({this.response, this.island});

  @override
  List<dynamic> get props => [response, island];

  SearchState copyWith({SearchResponse response, Island island}) => SearchState(
    island: island ?? this.island,
    response: response ?? this.response
  );
}