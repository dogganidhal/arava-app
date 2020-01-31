// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent(this._type);

  factory AuthEvent.loadAuth() = LoadAuth;

  factory AuthEvent.logOut() = LogOut;

  factory AuthEvent.tryLogin(
      {@required String email, @required String password}) = TryLogin;

  factory AuthEvent.trySignUp(
      {@required String email,
      @required String firstName,
      @required String lastName,
      @required String password}) = TrySignUp;

  final _AuthEvent _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(LoadAuth) loadAuth,
      @required FutureOr<R> Function(LogOut) logOut,
      @required FutureOr<R> Function(TryLogin) tryLogin,
      @required FutureOr<R> Function(TrySignUp) trySignUp}) {
    assert(() {
      if (loadAuth == null ||
          logOut == null ||
          tryLogin == null ||
          trySignUp == null) throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.LoadAuth:
        return loadAuth(this as LoadAuth);
      case _AuthEvent.LogOut:
        return logOut(this as LogOut);
      case _AuthEvent.TryLogin:
        return tryLogin(this as TryLogin);
      case _AuthEvent.TrySignUp:
        return trySignUp(this as TrySignUp);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(LoadAuth) loadAuth,
      FutureOr<R> Function(LogOut) logOut,
      FutureOr<R> Function(TryLogin) tryLogin,
      FutureOr<R> Function(TrySignUp) trySignUp,
      @required FutureOr<R> Function(AuthEvent) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.LoadAuth:
        if (loadAuth == null) break;
        return loadAuth(this as LoadAuth);
      case _AuthEvent.LogOut:
        if (logOut == null) break;
        return logOut(this as LogOut);
      case _AuthEvent.TryLogin:
        if (tryLogin == null) break;
        return tryLogin(this as TryLogin);
      case _AuthEvent.TrySignUp:
        if (trySignUp == null) break;
        return trySignUp(this as TrySignUp);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(LoadAuth) loadAuth,
      FutureOr<void> Function(LogOut) logOut,
      FutureOr<void> Function(TryLogin) tryLogin,
      FutureOr<void> Function(TrySignUp) trySignUp}) {
    assert(() {
      if (loadAuth == null &&
          logOut == null &&
          tryLogin == null &&
          trySignUp == null) throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.LoadAuth:
        if (loadAuth == null) break;
        return loadAuth(this as LoadAuth);
      case _AuthEvent.LogOut:
        if (logOut == null) break;
        return logOut(this as LogOut);
      case _AuthEvent.TryLogin:
        if (tryLogin == null) break;
        return tryLogin(this as TryLogin);
      case _AuthEvent.TrySignUp:
        if (trySignUp == null) break;
        return trySignUp(this as TrySignUp);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoadAuth extends AuthEvent {
  const LoadAuth._() : super(_AuthEvent.LoadAuth);

  factory LoadAuth() {
    _instance ??= LoadAuth._();
    return _instance;
  }

  static LoadAuth _instance;
}

@immutable
class LogOut extends AuthEvent {
  const LogOut._() : super(_AuthEvent.LogOut);

  factory LogOut() {
    _instance ??= LogOut._();
    return _instance;
  }

  static LogOut _instance;
}

@immutable
class TryLogin extends AuthEvent {
  const TryLogin({@required this.email, @required this.password})
      : super(_AuthEvent.TryLogin);

  final String email;

  final String password;

  @override
  String toString() =>
      'TryLogin(email:${this.email},password:${this.password})';
  @override
  List get props => [email, password];
}

@immutable
class TrySignUp extends AuthEvent {
  const TrySignUp(
      {@required this.email,
      @required this.firstName,
      @required this.lastName,
      @required this.password})
      : super(_AuthEvent.TrySignUp);

  final String email;

  final String firstName;

  final String lastName;

  final String password;

  @override
  String toString() =>
      'TrySignUp(email:${this.email},firstName:${this.firstName},lastName:${this.lastName},password:${this.password})';
  @override
  List get props => [email, firstName, lastName, password];
}
