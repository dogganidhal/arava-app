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
  @JsonKey(nullable: true)
  final Media marker;
  @JsonKey(nullable: true)
  final Media sponsoredMarker;
  final List<PoiTheme> subThemes;
  final PoiTheme parent;

  PoiTheme({
    this.id, this.name, this.icon,
    this.parent, this.subThemes,
    this.marker, this.sponsoredMarker
  });

  factory PoiTheme.fromJson(Map<String, dynamic> json) => _$PoiThemeFromJson(json);
  Map<String, dynamic> toJson() => _$PoiThemeToJson(this);
}