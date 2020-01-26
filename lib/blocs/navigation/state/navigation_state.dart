import 'package:super_enum/super_enum.dart';

part 'navigation_state.g.dart';

@superEnum
enum _NavigationState {
  @Data(fields: [
    DataField('route', String),
    DataField('homeIndex', int)
  ])
  Navigator
}