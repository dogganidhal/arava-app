// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archipelago.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Archipelago _$ArchipelagoFromJson(Map<String, dynamic> json) {
  return Archipelago(
    id: json['id'] as String,
    name: json['name'] as String,
    islands: (json['islands'] as List)
        ?.map((e) =>
            e == null ? null : Island.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ArchipelagoToJson(Archipelago instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'islands': instance.islands,
    };
