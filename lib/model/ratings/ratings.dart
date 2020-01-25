import 'package:json_annotation/json_annotation.dart';

part 'ratings.g.dart';

@JsonSerializable()
class Ratings {
  final int count;
  final double averageScore;

  Ratings({this.count, this.averageScore});

  factory Ratings.fromJson(Map<String, dynamic> json) => _$RatingsFromJson(json);
  Map<String, dynamic> toJson() => _$RatingsToJson(this);
}