import 'package:arava/model/search_sort/search_sort.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_request.g.dart';

@JsonSerializable()
class SearchRequest {
  @JsonKey(nullable: true)
  final String title;
  @JsonKey(nullable: true)
  final String island;
  @JsonKey(nullable: true)
  final String category;
  @JsonKey(nullable: true)
  final String Region;
  @JsonKey(nullable: true)
  final SearchSort sort;

  SearchRequest({
    this.title, this.island,
    this.category, this.Region, this.sort
  });

  factory SearchRequest.fromJson(Map<String, dynamic> json) => _$SearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SearchRequestToJson(this);
}