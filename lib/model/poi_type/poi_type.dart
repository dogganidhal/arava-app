import 'package:arava_app/model/media/media.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poi_type.g.dart';

@JsonSerializable()
class PoiType {
  final String id;
  final Map<String, String> name;
  final Media icon;

  PoiType({
    this.id, this.name, this.icon
  });

  factory PoiType.fromJson(Map<String, dynamic> json) => _$PoiTypeFromJson(json);
  Map<String, dynamic> toJson() => _$PoiTypeToJson(this);
}