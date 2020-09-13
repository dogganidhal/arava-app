import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:super_enum/super_enum.dart';

part 'lat_lng.g.dart';

@JsonSerializable()
@immutable
class LatLng extends Equatable {
  final double latitude;
  final double longitude;

  LatLng({this.latitude, this.longitude});



  factory LatLng.fromJson(Map<String, dynamic> json) => _$LatLngFromJson(json);
  Map<String, dynamic> toJson() => _$LatLngToJson(this);

  @override
  List<dynamic> get props => [latitude, longitude];
}