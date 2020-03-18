// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_comment_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateCommentRequest _$RateCommentRequestFromJson(Map<String, dynamic> json) {
  return RateCommentRequest(
    comment: json['comment'] as String,
    rating: (json['rating'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$RateCommentRequestToJson(RateCommentRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'rating': instance.rating,
    };
