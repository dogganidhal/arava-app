import 'package:arava/model/user/user.dart';
import 'package:super_enum/super_enum.dart';

part 'auth_state.g.dart';

@superEnum
enum _AuthState {
  @object
  Loading,
  @object
  Anonymous,
  @Data(fields: [
    DataField('user', User)
  ])
  Authenticated
}