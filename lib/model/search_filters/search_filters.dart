import 'package:arava/model/search_sort/search_sort.dart';
import 'package:flutter/cupertino.dart';


@immutable
class SearchFilters {
  final String query;
  final bool sponsored;
  final List<String> themeIds;
  final SearchSort sort;

  SearchFilters({
    this.query, this.themeIds, this.sort, this.sponsored
  });

  SearchFilters withQuery(String query) => SearchFilters(
    query: query,
    themeIds: themeIds,
    sort: sort,
    sponsored: sponsored
  );

  SearchFilters withThemeId(List<String> themeId) => SearchFilters(
    query: query,
    themeIds: themeId,
    sort: sort,
    sponsored: sponsored
  );

  SearchFilters withSort(SearchSort sort) => SearchFilters(
    query: query,
    themeIds: themeIds,
    sort: sort,
    sponsored: sponsored
  );

  SearchFilters withSponsored(bool sponsored) => SearchFilters(
    query: query,
    themeIds: themeIds,
    sort: sort,
    sponsored: sponsored
  );
}