import 'package:super_enum/super_enum.dart';

part 'auth_event.g.dart';

@superEnum
enum _AuthEvent {
  @object
  LoadAuthEvent,
  @object
  LogOutEvent,
  @Data(fields: [
    DataField<String>('email'),
    DataField<String>('password')
  ])
  TryLoginEvent,
  @Data(fields: [
    DataField<String>('email'),
    DataField<String>('firstName'),
    DataField<String>('lastName'),
    DataField<String>('password')
  ])
  TrySignUpEvent
}