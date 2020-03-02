// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent(this._type);

  factory AuthEvent.loadAuthEvent() = LoadAuthEvent;

  factory AuthEvent.logOutEvent() = LogOutEvent;

  factory AuthEvent.tryLoginEvent(
      {@required String email, @required String password}) = TryLoginEvent;

  factory AuthEvent.trySignUpEvent(
      {@required String email,
      @required String firstName,
      @required String lastName,
      @required String password}) = TrySignUpEvent;

  final _AuthEvent _type;

//ignore: missing_return
  R when<R>(
      {@required FutureOr<R> Function(LoadAuthEvent) loadAuthEvent,
      @required FutureOr<R> Function(LogOutEvent) logOutEvent,
      @required FutureOr<R> Function(TryLoginEvent) tryLoginEvent,
      @required FutureOr<R> Function(TrySignUpEvent) trySignUpEvent}) {
    assert(() {
      if (loadAuthEvent == null ||
          logOutEvent == null ||
          tryLoginEvent == null ||
          trySignUpEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.LoadAuthEvent:
        return loadAuthEvent(this as LoadAuthEvent);
      case _AuthEvent.LogOutEvent:
        return logOutEvent(this as LogOutEvent);
      case _AuthEvent.TryLoginEvent:
        return tryLoginEvent(this as TryLoginEvent);
      case _AuthEvent.TrySignUpEvent:
        return trySignUpEvent(this as TrySignUpEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(LoadAuthEvent) loadAuthEvent,
      FutureOr<R> Function(LogOutEvent) logOutEvent,
      FutureOr<R> Function(TryLoginEvent) tryLoginEvent,
      FutureOr<R> Function(TrySignUpEvent) trySignUpEvent,
      @required FutureOr<R> Function(AuthEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.LoadAuthEvent:
        if (loadAuthEvent == null) break;
        return loadAuthEvent(this as LoadAuthEvent);
      case _AuthEvent.LogOutEvent:
        if (logOutEvent == null) break;
        return logOutEvent(this as LogOutEvent);
      case _AuthEvent.TryLoginEvent:
        if (tryLoginEvent == null) break;
        return tryLoginEvent(this as TryLoginEvent);
      case _AuthEvent.TrySignUpEvent:
        if (trySignUpEvent == null) break;
        return trySignUpEvent(this as TrySignUpEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(LoadAuthEvent) loadAuthEvent,
      FutureOr<void> Function(LogOutEvent) logOutEvent,
      FutureOr<void> Function(TryLoginEvent) tryLoginEvent,
      FutureOr<void> Function(TrySignUpEvent) trySignUpEvent}) {
    assert(() {
      if (loadAuthEvent == null &&
          logOutEvent == null &&
          tryLoginEvent == null &&
          trySignUpEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AuthEvent.LoadAuthEvent:
        if (loadAuthEvent == null) break;
        return loadAuthEvent(this as LoadAuthEvent);
      case _AuthEvent.LogOutEvent:
        if (logOutEvent == null) break;
        return logOutEvent(this as LogOutEvent);
      case _AuthEvent.TryLoginEvent:
        if (tryLoginEvent == null) break;
        return tryLoginEvent(this as TryLoginEvent);
      case _AuthEvent.TrySignUpEvent:
        if (trySignUpEvent == null) break;
        return trySignUpEvent(this as TrySignUpEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoadAuthEvent extends AuthEvent {
  const LoadAuthEvent._() : super(_AuthEvent.LoadAuthEvent);

  factory LoadAuthEvent() {
    _instance ??= LoadAuthEvent._();
    return _instance;
  }

  static LoadAuthEvent _instance;
}

@immutable
class LogOutEvent extends AuthEvent {
  const LogOutEvent._() : super(_AuthEvent.LogOutEvent);

  factory LogOutEvent() {
    _instance ??= LogOutEvent._();
    return _instance;
  }

  static LogOutEvent _instance;
}

@immutable
class TryLoginEvent extends AuthEvent {
  const TryLoginEvent({@required this.email, @required this.password})
      : super(_AuthEvent.TryLoginEvent);

  final String email;

  final String password;

  @override
  String toString() =>
      'TryLoginEvent(email:${this.email},password:${this.password})';
  @override
  List get props => [email, password];
}

@immutable
class TrySignUpEvent extends AuthEvent {
  const TrySignUpEvent(
      {@required this.email,
      @required this.firstName,
      @required this.lastName,
      @required this.password})
      : super(_AuthEvent.TrySignUpEvent);

  final String email;

  final String firstName;

  final String lastName;

  final String password;

  @override
  String toString() =>
      'TrySignUpEvent(email:${this.email},firstName:${this.firstName},lastName:${this.lastName},password:${this.password})';
  @override
  List get props => [email, firstName, lastName, password];
}
