import 'package:super_enum/super_enum.dart';

part 'search_event.g.dart';

@superEnum
enum _SearchEvent {
  @Data(fields: [
    DataField('query', String)
  ])
  SearchForPois
}