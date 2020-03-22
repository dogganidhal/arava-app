import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:super_enum/super_enum.dart';

part 'global_context_event.g.dart';

@superEnum
enum _GlobalContextEvent {
  @Data(fields: [
    DataField<GlobalContextState>('context')
  ])
  GlobalContextEditEvent
}