import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'media.g.dart';

@JsonSerializable()
@immutable
class Media {
  final String id;
  final String url;
  final String type;

  Media({
    this.id, this.url, this.type
  });

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
  Map<String, dynamic> toJson() => _$MediaToJson(this);
}