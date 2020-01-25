// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiCategory _$PoiCategoryFromJson(Map<String, dynamic> json) {
  return PoiCategory(
    id: json['id'] as String,
    name: json['name'] as String,
    icon: json['icon'] == null
        ? null
        : Media.fromJson(json['icon'] as Map<String, dynamic>),
    type: json['type'] == null
        ? null
        : PoiType.fromJson(json['type'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PoiCategoryToJson(PoiCategory instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
      'type': instance.type,
    };
