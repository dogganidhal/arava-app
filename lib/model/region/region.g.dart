// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'region.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Region _$RegionFromJson(Map<String, dynamic> json) {
  return Region(
    center: json['center'] == null
        ? null
        : LatLng.fromJson(json['center'] as Map<String, dynamic>),
    distance: (json['distance'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RegionToJson(Region instance) => <String, dynamic>{
      'center': instance.center,
      'distance': instance.distance,
    };
