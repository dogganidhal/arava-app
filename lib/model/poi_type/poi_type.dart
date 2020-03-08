import 'package:arava/model/media/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'poi_type.g.dart';

@JsonSerializable()
@immutable
class PoiTheme {
  final String id;
  final String name;
  final Media icon;

  PoiTheme({
    this.id, this.name, this.icon
  });

  factory PoiTheme.fromJson(Map<String, dynamic> json) => _$PoiThemeFromJson(json);
  Map<String, dynamic> toJson() => _$PoiThemeToJson(this);
}