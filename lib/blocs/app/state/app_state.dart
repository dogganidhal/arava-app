import 'package:arava_app/model/app_configuration/app_configuration.dart';
import 'package:super_enum/super_enum.dart';

part 'app_state.g.dart';

@superEnum
enum _AppState {
  @object
  Loading,
  @object
  Unintialized,
  @object
  FirstLaunch,
  @Data(fields: [
    DataField('appConfiguration', AppConfiguration)
  ])
  AppLoaded
}