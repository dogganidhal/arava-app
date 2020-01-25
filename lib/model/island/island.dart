import 'package:json_annotation/json_annotation.dart';

part 'island.g.dart';

@JsonSerializable()
class Island {
  final String id;
  final String name;
  final String archipelago;

  Island({
    this.id, this.name, this.archipelago
  });

  factory Island.fromJson(Map<String, dynamic> json) => _$IslandFromJson(json);
  Map<String, dynamic> toJson() => _$IslandToJson(this);
}