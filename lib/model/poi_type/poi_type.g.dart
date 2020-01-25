// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_type.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiType _$PoiTypeFromJson(Map<String, dynamic> json) {
  return PoiType(
    id: json['id'] as String,
    name: (json['name'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    icon: json['icon'] == null
        ? null
        : Media.fromJson(json['icon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PoiTypeToJson(PoiType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'icon': instance.icon,
    };
