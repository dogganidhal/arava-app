import 'package:arava/model/media/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'comment_author.g.dart';

@immutable
@JsonSerializable()
class CommentAuthor {
  final String id;
  final String fullName;
  @JsonKey(nullable: true)
  final Media avatar;

  CommentAuthor({this.id, this.fullName, this.avatar});

  factory CommentAuthor.fromJson(Map<String, dynamic> json) => _$CommentAuthorFromJson(json);
  Map<String, dynamic> toJson() => _$CommentAuthorToJson(this);
}