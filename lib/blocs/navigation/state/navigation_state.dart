import 'package:super_enum/super_enum.dart';

part 'navigation_state.g.dart';

@superEnum
enum _NavigationState {
  @Data(fields: [
    DataField<String>('route'),
    DataField<int>('homeIndex')
  ])
  NavigatorState
}