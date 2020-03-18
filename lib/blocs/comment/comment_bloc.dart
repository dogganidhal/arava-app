import 'package:arava/blocs/comment/event/comment_event.dart';
import 'package:arava/blocs/comment/state/comment_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/comment/comment.dart';
import 'package:arava/model/comment_author/comment_author.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/rate_comment_request/rate_comment_request.dart';
import 'package:arava/service/poi_service.dart';
import 'package:arava/service/session.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final PoiService poiService;
  final NavigationBloc navigationBloc;
  final Session session;

  CommentBloc({
    @required this.poiService,
    @required this.navigationBloc,
    @required this.session
  });

  @override
  CommentState get initialState => CommentState.commentReadyState();

  @override
  Stream<CommentState> mapEventToState(CommentEvent event) => event.when(
    commentSubmitEvent: _submit
  );

  void submitComment({@required Poi poi, @required RateCommentRequest request}) {
    add(CommentEvent.commentSubmitEvent(poi: poi, request: request));
  }

  Stream<CommentState> _submit(CommentSubmitEvent event) async* {
    yield CommentState.commentLoadingState();
    try {
      await poiService.submitComment(event.poi, event.request);
      navigationBloc.pop(Comment(
        content: event.request.comment,
        date: DateTime.now(),
        author: CommentAuthor(
          fullName: "${session.cachedUser.firstName} ${session.cachedUser.lastName}"
        )
      ));
    } on AppException catch (exception) {
      yield CommentState.commentFailingState(exception: exception);
    }
  }
}