import 'package:super_enum/super_enum.dart';

part 'app_event.g.dart';

@superEnum
enum _AppEvent {
  @object
  LoadAppEvent,
  @Data(fields: [
    DataField<String>('locale')
  ])
  ChangeLocaleEvent,
  @object
  ConfirmFirstLaunchEvent
}