import 'package:arava/model/region/region.dart';
import 'package:arava/model/search_sort/search_sort.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_request.g.dart';

@JsonSerializable()
@immutable
class SearchRequest {
  @JsonKey(nullable: true)
  final String title;
  @JsonKey(nullable: true)
  final String island;
  @JsonKey(nullable: true)
  final String themeId;
  @JsonKey(nullable: true)
  final Region region;
  @JsonKey(nullable: true)
  final SearchSort sort;

  const SearchRequest({
    this.title, this.island,
    this.themeId, this.region, this.sort
  });

  SearchRequest withTitle(String title) => SearchRequest(
    title: title,
    island: this.island,
    themeId: this.themeId,
    region: this.region,
    sort: this.sort,
  );

  SearchRequest withIsland(String island) => SearchRequest(
    title: this.title,
    island: island,
    themeId: this.themeId,
    region: this.region,
    sort: this.sort,
  );

  SearchRequest withThemeId(String themeId) => SearchRequest(
    title: this.title,
    island: this.island,
    themeId: themeId,
    region: this.region,
    sort: this.sort,
  );

  SearchRequest withRegion(Region region) => SearchRequest(
    title: this.title,
    island: this.island,
    themeId: this.themeId,
    region: region,
    sort: this.sort,
  );

  SearchRequest withSort(SearchSort sort) => SearchRequest(
    title: this.title,
    island: this.island,
    themeId: this.themeId,
    region: this.region,
    sort: sort,
  );

  factory SearchRequest.fromJson(Map<String, dynamic> json) => _$SearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}