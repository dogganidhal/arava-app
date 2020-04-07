import 'package:arava/model/search_sort/search_sort.dart';
import 'package:flutter/cupertino.dart';


@immutable
class SearchFilters {
  final String query;
  final bool featured;
  final List<String> themeIds;
  final SearchSort sort;

  SearchFilters({
    this.query, this.themeIds, this.sort, this.featured
  });

  SearchFilters withQuery(String query) => SearchFilters(
    query: query,
    themeIds: themeIds,
    sort: sort,
    featured: featured
  );

  SearchFilters withThemeId(List<String> themeId) => SearchFilters(
    query: query,
    themeIds: themeId,
    sort: sort,
    featured: featured
  );

  SearchFilters withSort(SearchSort sort) => SearchFilters(
    query: query,
    themeIds: themeIds,
    sort: sort,
    featured: featured
  );

  SearchFilters withSponsored(bool sponsored) => SearchFilters(
    query: query,
    themeIds: themeIds,
    sort: sort,
    featured: sponsored
  );
}