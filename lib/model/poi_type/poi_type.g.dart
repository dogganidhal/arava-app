// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiTheme _$PoiThemeFromJson(Map<String, dynamic> json) {
  return PoiTheme(
    id: json['id'] as String,
    name: json['name'] as String,
    icon: json['icon'] == null
        ? null
        : Media.fromJson(json['icon'] as Map<String, dynamic>),
    parent: json['parent'] == null
        ? null
        : PoiTheme.fromJson(json['parent'] as Map<String, dynamic>),
    subThemes: (json['subThemes'] as List)
        ?.map((e) =>
            e == null ? null : PoiTheme.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    marker: json['marker'] == null
        ? null
        : Media.fromJson(json['marker'] as Map<String, dynamic>),
    sponsoredMarker: json['sponsoredMarker'] == null
        ? null
        : Media.fromJson(json['sponsoredMarker'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PoiThemeToJson(PoiTheme instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'marker': instance.marker,
      'sponsoredMarker': instance.sponsoredMarker,
      'subThemes': instance.subThemes,
      'parent': instance.parent,
    };
