import 'package:arava/exception/app_exception.dart';
import 'package:super_enum/super_enum.dart';

part 'profile_state.g.dart';

@superEnum
enum _ProfileState {
  @object
  ProfileUpdateIdleState,
  @object
  ProfileUpdateLoadingState,
  @object
  ProfileUpdateSuccessState,
  @Data(fields: [
    DataField<AppException>('exception')
  ])
  ProfileUpdateFailedState
}