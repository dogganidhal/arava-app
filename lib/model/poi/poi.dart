import 'package:arava_app/model/comment/comment.dart';
import 'package:arava_app/model/lat_lng/lat_lng.dart';
import 'package:arava_app/model/media/media.dart';
import 'package:arava_app/model/poi_category/poi_category.dart';
import 'package:arava_app/model/ratings/ratings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'poi.g.dart';

@JsonSerializable()
class Poi {
  final String id;
  final String island;
  final String title;
  final String description;
  final bool featured;
  final bool sponsored;
  final bool thingsToDo;
  final PoiCategory category;
  final LatLng coordinate;
  final List<Media> medias;
  final List<Comment> comments;
  final Ratings ratings;

  Poi({
    this.id, this.island, this.featured,
    this.sponsored, this.thingsToDo, this.title,
    this.category, this.coordinate, this.description,
    this.medias, this.comments, this.ratings
  });
}