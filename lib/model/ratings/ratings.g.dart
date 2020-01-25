// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ratings _$RatingsFromJson(Map<String, dynamic> json) {
  return Ratings(
    count: json['count'] as int,
    averageScore: (json['averageScore'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RatingsToJson(Ratings instance) => <String, dynamic>{
      'count': instance.count,
      'averageScore': instance.averageScore,
    };
