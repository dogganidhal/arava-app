// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthState extends Equatable {
  const AuthState(this._type);

  factory AuthState.authLoadingState() = AuthLoadingState;

  factory AuthState.authAnonymousState() = AuthAnonymousState;

  factory AuthState.authAuthenticatedState(
      {@required JwtAuthCredentials credentials,
      @required User user}) = AuthAuthenticatedState;

  factory AuthState.authFailedState({@required AppException exception}) =
      AuthFailedState;

  final _AuthState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AuthLoadingState) authLoadingState,
      @required R Function(AuthAnonymousState) authAnonymousState,
      @required R Function(AuthAuthenticatedState) authAuthenticatedState,
      @required R Function(AuthFailedState) authFailedState}) {
    assert(() {
      if (authLoadingState == null ||
          authAnonymousState == null ||
          authAuthenticatedState == null ||
          authFailedState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.AuthLoadingState:
        return authLoadingState(this as AuthLoadingState);
      case _AuthState.AuthAnonymousState:
        return authAnonymousState(this as AuthAnonymousState);
      case _AuthState.AuthAuthenticatedState:
        return authAuthenticatedState(this as AuthAuthenticatedState);
      case _AuthState.AuthFailedState:
        return authFailedState(this as AuthFailedState);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required
          FutureOr<R> Function(AuthLoadingState) authLoadingState,
      @required
          FutureOr<R> Function(AuthAnonymousState) authAnonymousState,
      @required
          FutureOr<R> Function(AuthAuthenticatedState) authAuthenticatedState,
      @required
          FutureOr<R> Function(AuthFailedState) authFailedState}) {
    assert(() {
      if (authLoadingState == null ||
          authAnonymousState == null ||
          authAuthenticatedState == null ||
          authFailedState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.AuthLoadingState:
        return authLoadingState(this as AuthLoadingState);
      case _AuthState.AuthAnonymousState:
        return authAnonymousState(this as AuthAnonymousState);
      case _AuthState.AuthAuthenticatedState:
        return authAuthenticatedState(this as AuthAuthenticatedState);
      case _AuthState.AuthFailedState:
        return authFailedState(this as AuthFailedState);
    }
  }

  R whenOrElse<R>(
      {R Function(AuthLoadingState) authLoadingState,
      R Function(AuthAnonymousState) authAnonymousState,
      R Function(AuthAuthenticatedState) authAuthenticatedState,
      R Function(AuthFailedState) authFailedState,
      @required R Function(AuthState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.AuthLoadingState:
        if (authLoadingState == null) break;
        return authLoadingState(this as AuthLoadingState);
      case _AuthState.AuthAnonymousState:
        if (authAnonymousState == null) break;
        return authAnonymousState(this as AuthAnonymousState);
      case _AuthState.AuthAuthenticatedState:
        if (authAuthenticatedState == null) break;
        return authAuthenticatedState(this as AuthAuthenticatedState);
      case _AuthState.AuthFailedState:
        if (authFailedState == null) break;
        return authFailedState(this as AuthFailedState);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(AuthLoadingState) authLoadingState,
      FutureOr<R> Function(AuthAnonymousState) authAnonymousState,
      FutureOr<R> Function(AuthAuthenticatedState) authAuthenticatedState,
      FutureOr<R> Function(AuthFailedState) authFailedState,
      @required FutureOr<R> Function(AuthState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.AuthLoadingState:
        if (authLoadingState == null) break;
        return authLoadingState(this as AuthLoadingState);
      case _AuthState.AuthAnonymousState:
        if (authAnonymousState == null) break;
        return authAnonymousState(this as AuthAnonymousState);
      case _AuthState.AuthAuthenticatedState:
        if (authAuthenticatedState == null) break;
        return authAuthenticatedState(this as AuthAuthenticatedState);
      case _AuthState.AuthFailedState:
        if (authFailedState == null) break;
        return authFailedState(this as AuthFailedState);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(AuthLoadingState) authLoadingState,
      FutureOr<void> Function(AuthAnonymousState) authAnonymousState,
      FutureOr<void> Function(AuthAuthenticatedState) authAuthenticatedState,
      FutureOr<void> Function(AuthFailedState) authFailedState}) {
    assert(() {
      if (authLoadingState == null &&
          authAnonymousState == null &&
          authAuthenticatedState == null &&
          authFailedState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthState.AuthLoadingState:
        if (authLoadingState == null) break;
        return authLoadingState(this as AuthLoadingState);
      case _AuthState.AuthAnonymousState:
        if (authAnonymousState == null) break;
        return authAnonymousState(this as AuthAnonymousState);
      case _AuthState.AuthAuthenticatedState:
        if (authAuthenticatedState == null) break;
        return authAuthenticatedState(this as AuthAuthenticatedState);
      case _AuthState.AuthFailedState:
        if (authFailedState == null) break;
        return authFailedState(this as AuthFailedState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class AuthLoadingState extends AuthState {
  const AuthLoadingState._() : super(_AuthState.AuthLoadingState);

  factory AuthLoadingState() {
    _instance ??= const AuthLoadingState._();
    return _instance;
  }

  static AuthLoadingState _instance;
}

@immutable
class AuthAnonymousState extends AuthState {
  const AuthAnonymousState._() : super(_AuthState.AuthAnonymousState);

  factory AuthAnonymousState() {
    _instance ??= const AuthAnonymousState._();
    return _instance;
  }

  static AuthAnonymousState _instance;
}

@immutable
class AuthAuthenticatedState extends AuthState {
  const AuthAuthenticatedState(
      {@required this.credentials, @required this.user})
      : super(_AuthState.AuthAuthenticatedState);

  final JwtAuthCredentials credentials;

  final User user;

  @override
  String toString() =>
      'AuthAuthenticatedState(credentials:${this.credentials},user:${this.user})';
  @override
  List get props => [credentials, user];
}

@immutable
class AuthFailedState extends AuthState {
  const AuthFailedState({@required this.exception})
      : super(_AuthState.AuthFailedState);

  final AppException exception;

  @override
  String toString() => 'AuthFailedState(exception:${this.exception})';
  @override
  List get props => [exception];
}
