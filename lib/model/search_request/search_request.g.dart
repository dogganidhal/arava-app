// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchRequest _$SearchRequestFromJson(Map<String, dynamic> json) {
  return SearchRequest(
    title: json['title'] as String,
    island: json['island'] as String,
    sponsored: json['sponsored'] as bool,
    themeIds: (json['themeIds'] as List)?.map((e) => e as String)?.toList(),
    region: json['region'] == null
        ? null
        : Region.fromJson(json['region'] as Map<String, dynamic>),
    sort: json['sort'] == null
        ? null
        : SearchSort.fromJson(json['sort'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SearchRequestToJson(SearchRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'island': instance.island,
      'themeIds': instance.themeIds,
      'region': instance.region,
      'sort': instance.sort,
      'sponsored': instance.sponsored,
    };
