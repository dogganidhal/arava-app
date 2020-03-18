import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'rate_comment_request.g.dart';

@immutable
@JsonSerializable()
class RateCommentRequest {
  final String comment;
  final double rating;

  RateCommentRequest({this.comment, this.rating});

  factory RateCommentRequest.fromJson(Map<String, dynamic> json) => _$RateCommentRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RateCommentRequestToJson(this);
}