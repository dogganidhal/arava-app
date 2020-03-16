// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    northEast: json['northEast'] == null
        ? null
        : LatLng.fromJson(json['northEast'] as Map<String, dynamic>),
    southWest: json['southWest'] == null
        ? null
        : LatLng.fromJson(json['southWest'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'southWest': instance.southWest,
      'northEast': instance.northEast,
    };
