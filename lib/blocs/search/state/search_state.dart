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
  final bool regionDidChange;
  final bool emptyResult;

  SearchState({
    this.loading = false,
    this.response,
    this.request = const SearchRequest(),
    this.selectedPoi,
    this.island,
    this.exception,
    this.regionDidChange = false,
    this.emptyResult = false
  });

  @override
  List<dynamic> get props => [loading, response, request, selectedPoi, island, exception];

  SearchState withLoading(bool loading) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withIsland(Island island) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withResponse(SearchResponse response) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withSelectedPoi(Poi selectedPoi) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withRequest(SearchRequest request) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withException(AppException exception) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withRegionDidChange(bool regionDidChange) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );

  SearchState withEmptyResult(bool emptyResult) => SearchState(
    loading: loading,
    island: island,
    response: response,
    selectedPoi: selectedPoi,
    request: request,
    exception: exception,
    regionDidChange: regionDidChange,
    emptyResult: emptyResult
  );
}