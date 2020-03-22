import 'package:arava/model/poi/poi.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'favorite.g.dart';

@immutable
@JsonSerializable()
class Favorite {
  final String id;
  final Poi poi;

  Favorite({this.id, this.poi});

  factory Favorite.fromJson(Map<String, dynamic> json) => _$FavoriteFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteToJson(this);
}