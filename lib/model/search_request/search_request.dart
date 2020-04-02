import 'package:arava/model/region/region.dart';
import 'package:arava/model/search_sort/search_sort.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_request.g.dart';

@JsonSerializable()
@immutable
class SearchRequest {
  @JsonKey(nullable: true, includeIfNull: false)
  final String title;
  @JsonKey(nullable: true, includeIfNull: false)
  final String island;
  @JsonKey(nullable: true, includeIfNull: false)
  final List<String> themeIds;
  @JsonKey(nullable: true, includeIfNull: false)
  final Region region;
  @JsonKey(nullable: true, includeIfNull: false)
  final SearchSort sort;
  @JsonKey(defaultValue: true)
  final bool featured;

  const SearchRequest({
    this.title, this.island, this.featured = false,
    this.themeIds = const [], this.region, this.sort
  });

  SearchRequest withTitle(String title) => SearchRequest(
    title: title,
    island: island,
    themeIds: themeIds,
    region: region,
    sort: sort,
    featured: featured
  );

  SearchRequest withIsland(String island) => SearchRequest(
    title: title,
    island: island,
    themeIds: themeIds,
    region: region,
    sort: sort,
    featured: featured
  );

  SearchRequest withThemeIds(List<String> themeIds) => SearchRequest(
    title: title,
    island: island,
    themeIds: themeIds,
    region: region,
    sort: sort,
    featured: featured
  );

  SearchRequest withRegion(Region region) => SearchRequest(
    title: title,
    island: island,
    themeIds: themeIds,
    region: region,
    sort: sort,
    featured: featured
  );

  SearchRequest withSort(SearchSort sort) => SearchRequest(
    title: title,
    island: island,
    themeIds: themeIds,
    region: region,
    sort: sort,
    featured: featured
  );

  SearchRequest withSponsored(bool sponsored) => SearchRequest(
    title: title,
    island: island,
    themeIds: themeIds,
    region: region,
    sort: sort,
    featured: sponsored
  );

  factory SearchRequest.fromJson(Map<String, dynamic> json) => _$SearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}