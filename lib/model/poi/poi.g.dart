// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Poi _$PoiFromJson(Map<String, dynamic> json) {
  return Poi(
    id: json['id'] as String,
    island: json['island'] as String,
    featured: json['featured'] as bool,
    sponsored: json['sponsored'] as bool,
    title: json['title'] as String,
    mainImage: json['mainImage'] == null
        ? null
        : Media.fromJson(json['mainImage'] as Map<String, dynamic>),
    theme: json['theme'] == null
        ? null
        : PoiTheme.fromJson(json['theme'] as Map<String, dynamic>),
    coordinate: json['coordinate'] == null
        ? null
        : LatLng.fromJson(json['coordinate'] as Map<String, dynamic>),
    description: json['description'] as String,
    medias: (json['medias'] as List)
        ?.map(
            (e) => e == null ? null : Media.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    comments: (json['comments'] as List)
        ?.map((e) =>
            e == null ? null : Comment.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    ratings: json['ratings'] == null
        ? null
        : Ratings.fromJson(json['ratings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$PoiToJson(Poi instance) => <String, dynamic>{
      'id': instance.id,
      'island': instance.island,
      'title': instance.title,
      'theme': instance.theme,
      'description': instance.description,
      'featured': instance.featured,
      'sponsored': instance.sponsored,
      'coordinate': instance.coordinate,
      'mainImage': instance.mainImage,
      'medias': instance.medias,
      'comments': instance.comments,
      'ratings': instance.ratings,
    };
