import 'package:arava/model/poi/poi.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_response.g.dart';

@immutable
@JsonSerializable()
class SearchResponse {
  final List<Poi> pois;
  final List<Poi> premiumPois;
  final int count;
  final int premiumCount;

  SearchResponse({this.pois, this.count, this.premiumCount, this.premiumPois});

  factory SearchResponse.fromJson(Map<String, dynamic> json) => _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}