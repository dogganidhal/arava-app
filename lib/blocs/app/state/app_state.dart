import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:super_enum/super_enum.dart';

part 'app_state.g.dart';

@superEnum
enum _AppState {
  @object
  Loading,
  @object
  Unintialized,
  @Data(fields: [
    DataField('language', String)
  ])
  FirstLaunch,
  @Data(fields: [
    DataField('appConfiguration', AppConfiguration)
  ])
  AppLoaded,
  @Data(fields: [
    DataField('exception', AppException)
  ])
  Error
}