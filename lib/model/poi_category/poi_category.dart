import 'package:arava/model/media/media.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'poi_category.g.dart';

@JsonSerializable()
@immutable
class PoiCategory {
  final String id;
  final String name;
  final Media icon;
  final PoiType type;

  PoiCategory({
    this.id, this.name, this.icon, this.type
  });

  factory PoiCategory.fromJson(Map<String, dynamic> json) => _$PoiCategoryFromJson(json);
  Map<String, dynamic> toJson() => _$PoiCategoryToJson(this);
}