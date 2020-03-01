import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
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
    DataField('credentials', JwtAuthCredentials),
    DataField('user', User)
  ])
  Authenticated
}