import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'search_sort.g.dart';

enum SearchSortDirection {
  @JsonValue('ASC')
  ASC,
  @JsonValue('DESC')
  DESC
}

@JsonSerializable()
@immutable
class SearchSort {
  final SearchSortDirection direction;
  final String field;

  SearchSort({this.direction, this.field});

  factory SearchSort.fromJson(Map<String, dynamic> json) => _$SearchSortFromJson(json);
  Map<String, dynamic> toJson() => _$SearchSortToJson(this);
}