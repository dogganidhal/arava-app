import 'package:arava/model/lat_lng/lat_lng.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'region.g.dart';

@JsonSerializable()
@immutable
class Region {
  final LatLng southWest;
  final LatLng northEast;

  Region({this.northEast, this.southWest});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}