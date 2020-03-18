// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_author.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentAuthor _$CommentAuthorFromJson(Map<String, dynamic> json) {
  return CommentAuthor(
    id: json['id'] as String,
    fullName: json['fullName'] as String,
    avatar: json['avatar'] == null
        ? null
        : Media.fromJson(json['avatar'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CommentAuthorToJson(CommentAuthor instance) =>
    <String, dynamic>{
      'id': instance.id,
      'fullName': instance.fullName,
      'avatar': instance.avatar,
    };
