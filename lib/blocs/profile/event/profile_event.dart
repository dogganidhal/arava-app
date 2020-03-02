import 'package:arava/model/update_profile_request/update_profile_request.dart';
import 'package:super_enum/super_enum.dart';

part 'profile_event.g.dart';

@superEnum
enum _ProfileEvent {
  @Data(fields: [
    DataField<UpdateProfileRequest>('request'),
  ])
  UpdateProfileEvent
}