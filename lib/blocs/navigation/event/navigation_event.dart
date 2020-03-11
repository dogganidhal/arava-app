import 'package:super_enum/super_enum.dart';

part 'navigation_event.g.dart';

@superEnum
enum _NavigationEvent {
  @object
  NavigationPopEvent,
  @Data(fields: [
    DataField<dynamic>('value')
  ])
  NavigationPopWithValueEvent,
  @Data(fields: [
    DataField<int>('index')
  ])
  NavigateToHomeEvent,
  @Data(fields: [
    DataField<String>('route')
  ])
  NavigationPushEvent
}