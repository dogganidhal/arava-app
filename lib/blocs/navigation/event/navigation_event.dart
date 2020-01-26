import 'package:super_enum/super_enum.dart';

part 'navigation_event.g.dart';

@superEnum
enum _NavigationEvent {
  @object
  Pop,
  @Data(fields: [
    DataField('index', int)
  ])
  NavigateToHome,
  @Data(fields: [
    DataField('route', String)
  ])
  Push
}