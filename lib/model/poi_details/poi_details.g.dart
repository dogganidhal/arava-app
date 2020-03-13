// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'poi_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PoiDetails _$PoiDetailsFromJson(Map<String, dynamic> json) {
  return PoiDetails(
    address: json['address'] as String,
    phone: json['phone'] as String,
    email: json['email'] as String,
    website: json['website'] as String,
    facebookUrl: json['facebookUrl'] as String,
    instagramAccount: json['instagramAccount'] as String,
    openingHours: json['openingHours'] as String,
  );
}

Map<String, dynamic> _$PoiDetailsToJson(PoiDetails instance) =>
    <String, dynamic>{
      'address': instance.address,
      'phone': instance.phone,
      'email': instance.email,
      'website': instance.website,
      'facebookUrl': instance.facebookUrl,
      'instagramAccount': instance.instagramAccount,
      'openingHours': instance.openingHours,
    };
