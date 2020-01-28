import 'package:arava/model/media/media.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class User {
  final String id;
  final String fullName;
  final Media avatar;

  User({
    this.id, this.fullName, this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}