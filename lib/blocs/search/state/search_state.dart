import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/search_request/search_request.dart';
import 'package:arava/model/search_response/search_response.dart';
import 'package:arava/model/island/island.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
class SearchState extends Equatable  {
  final bool loading;
  final SearchRequest request;
  final SearchResponse response;
  final Poi selectedPoi;
  final Island island;
  final AppException exception;

  SearchState({
    this.loading = false,
    this.response,
    this.request = const SearchRequest(),
    this.selectedPoi,
    this.island,
    this.exception
  });

  @override
  List<dynamic> get props => [loading, response, request, selectedPoi, island, exception];

  SearchState copyWith({
    bool loading,
    SearchResponse response,
    SearchRequest request,
    Poi selectedPoi,
    Island island,
    AppException exception
  }) => SearchState(
    loading: loading != null ? loading : this.loading,
    island: island ?? this.island,
    response: response ?? this.response,
    selectedPoi: selectedPoi ?? this.selectedPoi,
    request: request ?? this.request,
    exception: exception ?? this.exception
  );

  SearchState withLoading(bool loading) => SearchState(
    loading: loading,
    island: this.island,
    response: this.response,
    selectedPoi: this.selectedPoi,
    request: this.request,
    exception: this.exception,
  );

  SearchState withIsland(Island island) => SearchState(
    loading: this.loading,
    island: island,
    response: this.response,
    selectedPoi: this.selectedPoi,
    request: this.request,
    exception: this.exception,
  );

  SearchState withResponse(SearchResponse response) => SearchState(
    loading: this.loading,
    island: this.island,
    response: response,
    selectedPoi: this.selectedPoi,
    request: this.request,
    exception: this.exception,
  );

  SearchState withSelectedPoi(Poi selectedPoi) => SearchState(
    loading: this.loading,
    island: this.island,
    response: this.response,
    selectedPoi: selectedPoi,
    request: this.request,
    exception: this.exception,
  );

  SearchState withRequest(SearchRequest request) => SearchState(
    loading: this.loading,
    island: this.island,
    response: this.response,
    selectedPoi: this.selectedPoi,
    request: request,
    exception: this.exception,
  );

  SearchState withException(AppException exception) => SearchState(
    loading: this.loading,
    island: this.island,
    response: this.response,
    selectedPoi: this.selectedPoi,
    request: this.request,
    exception: exception,
  );
}