import 'package:arava/model/search_response/search_response.dart';
import 'package:arava/model/island/island.dart';
import 'package:super_enum/super_enum.dart';

part 'search_state.g.dart';

@superEnum
enum _SearchState {
  @Data(fields: [
    DataField('result', SearchResponse),
    DataField('selectedIsland', Island)
  ])
  Search
}