import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/rate_comment_request/rate_comment_request.dart';
import 'package:super_enum/super_enum.dart';

part 'comment_event.g.dart';

@superEnum
enum _CommentEvent {
  @Data(fields: [
    DataField<Poi>('poi'),
    DataField<RateCommentRequest>('request')
  ])
  CommentSubmitEvent
}