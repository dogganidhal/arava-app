import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:super_enum/super_enum.dart';

part 'featured_state.g.dart';

@superEnum
enum _FeaturedState {
  @object
  FeaturedLoadingState,
  @Data(fields: [
    DataField<List<Poi>>('featured'),
    DataField<List<Poi>>('activities')
  ])
  FeaturedReadyState,
  @Data(fields: [
    DataField<AppException>('exception')
  ])
  FeaturedFailingState
}