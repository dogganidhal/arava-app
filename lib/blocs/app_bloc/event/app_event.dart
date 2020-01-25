import 'package:super_enum/super_enum.dart';

part 'app_event.g.dart';

@superEnum
enum _AppEvent {
  @object
  LoadApp,
  @Data(fields: [
    DataField('locale', String)
  ])
  ChangeLocale,
  @object
  ConfirmFirstLaunch
}