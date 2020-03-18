// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class CommentState extends Equatable {
  const CommentState(this._type);

  factory CommentState.commentReadyState() = CommentReadyState;

  factory CommentState.commentLoadingState() = CommentLoadingState;

  factory CommentState.commentSuccessfulState() = CommentSuccessfulState;

  factory CommentState.commentFailingState({@required AppException exception}) =
      CommentFailingState;

  final _CommentState _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(CommentReadyState) commentReadyState,
      @required
          FutureOr<R> Function(CommentLoadingState) commentLoadingState,
      @required
          FutureOr<R> Function(CommentSuccessfulState) commentSuccessfulState,
      @required
          FutureOr<R> Function(CommentFailingState) commentFailingState}) {
    assert(() {
      if (commentReadyState == null ||
          commentLoadingState == null ||
          commentSuccessfulState == null ||
          commentFailingState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _CommentState.CommentReadyState:
        return commentReadyState(this as CommentReadyState);
      case _CommentState.CommentLoadingState:
        return commentLoadingState(this as CommentLoadingState);
      case _CommentState.CommentSuccessfulState:
        return commentSuccessfulState(this as CommentSuccessfulState);
      case _CommentState.CommentFailingState:
        return commentFailingState(this as CommentFailingState);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(CommentReadyState) commentReadyState,
      FutureOr<R> Function(CommentLoadingState) commentLoadingState,
      FutureOr<R> Function(CommentSuccessfulState) commentSuccessfulState,
      FutureOr<R> Function(CommentFailingState) commentFailingState,
      @required FutureOr<R> Function(CommentState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _CommentState.CommentReadyState:
        if (commentReadyState == null) break;
        return commentReadyState(this as CommentReadyState);
      case _CommentState.CommentLoadingState:
        if (commentLoadingState == null) break;
        return commentLoadingState(this as CommentLoadingState);
      case _CommentState.CommentSuccessfulState:
        if (commentSuccessfulState == null) break;
        return commentSuccessfulState(this as CommentSuccessfulState);
      case _CommentState.CommentFailingState:
        if (commentFailingState == null) break;
        return commentFailingState(this as CommentFailingState);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(CommentReadyState) commentReadyState,
      FutureOr<void> Function(CommentLoadingState) commentLoadingState,
      FutureOr<void> Function(CommentSuccessfulState) commentSuccessfulState,
      FutureOr<void> Function(CommentFailingState) commentFailingState}) {
    assert(() {
      if (commentReadyState == null &&
          commentLoadingState == null &&
          commentSuccessfulState == null &&
          commentFailingState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _CommentState.CommentReadyState:
        if (commentReadyState == null) break;
        return commentReadyState(this as CommentReadyState);
      case _CommentState.CommentLoadingState:
        if (commentLoadingState == null) break;
        return commentLoadingState(this as CommentLoadingState);
      case _CommentState.CommentSuccessfulState:
        if (commentSuccessfulState == null) break;
        return commentSuccessfulState(this as CommentSuccessfulState);
      case _CommentState.CommentFailingState:
        if (commentFailingState == null) break;
        return commentFailingState(this as CommentFailingState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class CommentReadyState extends CommentState {
  const CommentReadyState._() : super(_CommentState.CommentReadyState);

  factory CommentReadyState() {
    _instance ??= CommentReadyState._();
    return _instance;
  }

  static CommentReadyState _instance;
}

@immutable
class CommentLoadingState extends CommentState {
  const CommentLoadingState._() : super(_CommentState.CommentLoadingState);

  factory CommentLoadingState() {
    _instance ??= CommentLoadingState._();
    return _instance;
  }

  static CommentLoadingState _instance;
}

@immutable
class CommentSuccessfulState extends CommentState {
  const CommentSuccessfulState._()
      : super(_CommentState.CommentSuccessfulState);

  factory CommentSuccessfulState() {
    _instance ??= CommentSuccessfulState._();
    return _instance;
  }

  static CommentSuccessfulState _instance;
}

@immutable
class CommentFailingState extends CommentState {
  const CommentFailingState({@required this.exception})
      : super(_CommentState.CommentFailingState);

  final AppException exception;

  @override
  String toString() => 'CommentFailingState(exception:${this.exception})';
  @override
  List get props => [exception];
}
