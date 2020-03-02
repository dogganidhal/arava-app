import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'update_profile_request.g.dart';

@JsonSerializable()
@immutable
class UpdateProfileRequest {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String oldPassword;

  UpdateProfileRequest({
    this.firstName, this.lastName, this.email,
    this.password, @required this.oldPassword
  });

  factory UpdateProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateProfileRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateProfileRequestToJson(this);
}