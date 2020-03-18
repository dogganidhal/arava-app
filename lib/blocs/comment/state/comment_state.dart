import 'package:arava/exception/app_exception.dart';
import 'package:super_enum/super_enum.dart';

part 'comment_state.g.dart';

@superEnum
enum _CommentState {
  @object
  CommentReadyState,
  @object
  CommentLoadingState,
  @object
  CommentSuccessfulState,
  @Data(fields: [
    DataField<AppException>('exception')
  ])
  CommentFailingState
}