// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'island.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Island _$IslandFromJson(Map<String, dynamic> json) {
  return Island(
    id: json['id'] as String,
    name: json['name'] as String,
    archipelago: json['archipelago'] == null
        ? null
        : Archipelago.fromJson(json['archipelago'] as Map<String, dynamic>),
    center: json['center'] == null
        ? null
        : LatLng.fromJson(json['center'] as Map<String, dynamic>),
    zoom: (json['zoom'] as num)?.toDouble(),
    image: json['image'] == null
        ? null
        : Media.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$IslandToJson(Island instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'archipelago': instance.archipelago,
      'center': instance.center,
      'zoom': instance.zoom,
      'image': instance.image,
    };
