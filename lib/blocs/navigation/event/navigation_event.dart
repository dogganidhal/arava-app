import 'package:super_enum/super_enum.dart';

part 'navigation_event.g.dart';

@superEnum
enum _NavigationEvent {
  @object
  Pop,
  @object
  GoToHome,
  @Data(fields: [
    DataField('route', String)
  ])
  Push
}