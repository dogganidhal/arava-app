import 'package:arava_app/exception/app_exception.dart';
import 'package:arava_app/model/app_configuration/app_configuration.dart';
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