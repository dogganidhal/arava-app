import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/jwt_auth_credentials/jwt_auth_credentials.dart';
import 'package:arava/model/user/user.dart';
import 'package:super_enum/super_enum.dart';

part 'auth_state.g.dart';

@superEnum
enum _AuthState {
  @object
  AuthLoadingState,
  @object
  AuthAnonymousState,
  @Data(fields: [
    DataField<JwtAuthCredentials>('credentials'),
    DataField<User>('user')
  ])
  AuthAuthenticatedState,
  @Data(fields: [
    DataField<AppException>('exception')
  ])
  AuthFailedState
}