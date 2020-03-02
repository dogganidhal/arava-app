import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:super_enum/super_enum.dart';

part 'app_state.g.dart';

@superEnum
enum _AppState {
  @object
  AppLoadingState,
  @object
  AppUnintializedState,
  @Data(fields: [
    DataField<String>('language')
  ])
  AppFirstLaunchState,
  @Data(fields: [
    DataField<AppConfiguration>('appConfiguration')
  ])
  AppLoadedState,
  @Data(fields: [
    DataField<AppException>('exception')
  ])
  AppErrorState
}