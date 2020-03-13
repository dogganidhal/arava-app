import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'poi_details.g.dart';

@immutable
@JsonSerializable()
class PoiDetails {
  @JsonKey(nullable: true)
  final String address;
  @JsonKey(nullable: true)
  final String phone;
  @JsonKey(nullable: true)
  final String email;
  @JsonKey(nullable: true)
  final String website;
  @JsonKey(nullable: true)
  final String facebookUrl;
  @JsonKey(nullable: true)
  final String instagramAccount;
  @JsonKey(nullable: true)
  final String openingHours;

  PoiDetails({
    this.address, this.phone, this.email,
    this.website, this.facebookUrl,
    this.instagramAccount, this.openingHours
  });

  factory PoiDetails.fromJson(Map<String, dynamic> json) => _$PoiDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$PoiDetailsToJson(this);
}