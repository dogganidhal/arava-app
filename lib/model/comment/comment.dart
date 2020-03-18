import 'package:arava/model/comment_author/comment_author.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'comment.g.dart';

@JsonSerializable()
@immutable
class Comment {
  final String id;
  final String content;
  final CommentAuthor author;
  final DateTime date;

  Comment({
    this.id, this.content, this.author, this.date
  });

  factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}