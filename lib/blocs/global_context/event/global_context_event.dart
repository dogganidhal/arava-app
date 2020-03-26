import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/model/island/island.dart';
import 'package:super_enum/super_enum.dart';

part 'global_context_event.g.dart';

@superEnum
enum _GlobalContextEvent {
  @Data(fields: [
    DataField<Island>('island')
  ])
  GlobalContextSelectIslandEvent,
  @Data(fields: [
    DataField<AppConfiguration>('configuration')
  ])
  GlobalContextSetConfigurationEvent,
}