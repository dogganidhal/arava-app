import 'package:super_enum/super_enum.dart';

part 'app_event.g.dart';

@superEnum
enum _AppEvent {
  @object
  AppLoadEvent,
  @Data(fields: [
    DataField<String>('locale')
  ])
  AppChangeLocaleEvent,
  @object
  AppConfirmFirstLaunchEvent,
}