import 'package:arava/model/lat_lng/lat_lng.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'region.g.dart';

@JsonSerializable()
@immutable
class Region {
  final LatLng center;
  final double distance;

  Region({this.center, this.distance});

  factory Region.fromJson(Map<String, dynamic> json) => _$RegionFromJson(json);
  Map<String, dynamic> toJson() => _$RegionToJson(this);
}