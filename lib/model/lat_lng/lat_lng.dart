import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'lat_lng.g.dart';

@JsonSerializable()
@immutable
class LatLng {
  final double latitude;
  final double longitude;

  LatLng({this.latitude, this.longitude});

  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);
}