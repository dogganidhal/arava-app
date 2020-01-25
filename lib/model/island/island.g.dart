// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'island.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Island _$IslandFromJson(Map<String, dynamic> json) {
  return Island(
    id: json['id'] as String,
    name: json['name'] as String,
    archipelago: json['archipelago'] as String,
  );
}

Map<String, dynamic> _$IslandToJson(Island instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'archipelago': instance.archipelago,
    };
