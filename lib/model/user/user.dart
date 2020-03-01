import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;

  User({
    this.id, this.firstName, this.lastName, this.email
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}