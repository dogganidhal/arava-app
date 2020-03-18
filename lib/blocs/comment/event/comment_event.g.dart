// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CommentEvent extends Equatable {
  const CommentEvent(this._type);

  factory CommentEvent.commentSubmitEvent(
      {@required Poi poi,
      @required RateCommentRequest request}) = CommentSubmitEvent;

  final _CommentEvent _type;

//ignore: missing_return
  R when<R>(
      {@required FutureOr<R> Function(CommentSubmitEvent) commentSubmitEvent}) {
    assert(() {
      if (commentSubmitEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _CommentEvent.CommentSubmitEvent:
        return commentSubmitEvent(this as CommentSubmitEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(CommentSubmitEvent) commentSubmitEvent,
      @required FutureOr<R> Function(CommentEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _CommentEvent.CommentSubmitEvent:
        if (commentSubmitEvent == null) break;
        return commentSubmitEvent(this as CommentSubmitEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(CommentSubmitEvent) commentSubmitEvent}) {
    assert(() {
      if (commentSubmitEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _CommentEvent.CommentSubmitEvent:
        if (commentSubmitEvent == null) break;
        return commentSubmitEvent(this as CommentSubmitEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class CommentSubmitEvent extends CommentEvent {
  const CommentSubmitEvent({@required this.poi, @required this.request})
      : super(_CommentEvent.CommentSubmitEvent);

  final Poi poi;

  final RateCommentRequest request;

  @override
  String toString() =>
      'CommentSubmitEvent(poi:${this.poi},request:${this.request})';
  @override
  List get props => [poi, request];
}
