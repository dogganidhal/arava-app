// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) {
  return SearchRequest(
    title: json['title'] as String,
    island: json['island'] as String,
    category: json['category'] as String,
    Region: json['Region'] as String,
    sort: json['sort'] == null
        ? null
        : SearchSort.fromJson(json['sort'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'island': instance.island,
      'category': instance.category,
      'Region': instance.Region,
      'sort': instance.sort,
    };
