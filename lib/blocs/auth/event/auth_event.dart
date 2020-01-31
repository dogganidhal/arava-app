import 'package:super_enum/super_enum.dart';

part 'auth_event.g.dart';

@superEnum
enum _AuthEvent {
  @object
  LoadAuth,
  @object
  LogOut,
  @Data(fields: [
    DataField('email', String),
    DataField('password', String)
  ])
  TryLogin,
  @Data(fields: [
    DataField('email', String),
    DataField('firstName', String),
    DataField('lastName', String),
    DataField('password', String)
  ])
  TrySignUp
}