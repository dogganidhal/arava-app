import 'package:arava/model/archipelago/archipelago.dart';
import 'package:arava/model/lat_lng/lat_lng.dart';
import 'package:arava/model/media/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'island.g.dart';

@JsonSerializable()
@immutable
class Island {
  final String id;
  final String name;
  final Archipelago archipelago;
  final LatLng center;
  final double zoom;
  final Media image;

  Island({
    this.id, this.name, this.archipelago,
    this.center, this.zoom, this.image
  });

  factory Island.fromJson(Map<String, dynamic> json) => _$IslandFromJson(json);
  Map<String, dynamic> toJson() => _$IslandToJson(this);
}