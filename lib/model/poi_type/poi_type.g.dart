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
  );
}

Map<String, dynamic> _$PoiThemeToJson(PoiTheme instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
