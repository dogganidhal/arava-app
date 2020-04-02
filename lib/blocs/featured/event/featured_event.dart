import 'package:arava/model/island/island.dart';
import 'package:super_enum/super_enum.dart';

part 'featured_event.g.dart';

@superEnum
enum _FeaturedEvent {
  @Data(fields: [
    DataField<Island>('island')
  ])
  FeaturedLoadSponsoredEvent,
  @Data(fields: [
    DataField<Island>('island')
  ])
  FeaturedLoadActivitiesEvent
}