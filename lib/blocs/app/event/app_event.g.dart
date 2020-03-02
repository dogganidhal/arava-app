// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent(this._type);

  factory AppEvent.loadAppEvent() = LoadAppEvent;

  factory AppEvent.changeLocaleEvent({@required String locale}) =
      ChangeLocaleEvent;

  factory AppEvent.confirmFirstLaunchEvent() = ConfirmFirstLaunchEvent;

  final _AppEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(LoadAppEvent) loadAppEvent,
      @required
          FutureOr<R> Function(ChangeLocaleEvent) changeLocaleEvent,
      @required
          FutureOr<R> Function(ConfirmFirstLaunchEvent)
              confirmFirstLaunchEvent}) {
    assert(() {
      if (loadAppEvent == null ||
          changeLocaleEvent == null ||
          confirmFirstLaunchEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.LoadAppEvent:
        return loadAppEvent(this as LoadAppEvent);
      case _AppEvent.ChangeLocaleEvent:
        return changeLocaleEvent(this as ChangeLocaleEvent);
      case _AppEvent.ConfirmFirstLaunchEvent:
        return confirmFirstLaunchEvent(this as ConfirmFirstLaunchEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(LoadAppEvent) loadAppEvent,
      FutureOr<R> Function(ChangeLocaleEvent) changeLocaleEvent,
      FutureOr<R> Function(ConfirmFirstLaunchEvent) confirmFirstLaunchEvent,
      @required FutureOr<R> Function(AppEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.LoadAppEvent:
        if (loadAppEvent == null) break;
        return loadAppEvent(this as LoadAppEvent);
      case _AppEvent.ChangeLocaleEvent:
        if (changeLocaleEvent == null) break;
        return changeLocaleEvent(this as ChangeLocaleEvent);
      case _AppEvent.ConfirmFirstLaunchEvent:
        if (confirmFirstLaunchEvent == null) break;
        return confirmFirstLaunchEvent(this as ConfirmFirstLaunchEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(LoadAppEvent) loadAppEvent,
      FutureOr<void> Function(ChangeLocaleEvent) changeLocaleEvent,
      FutureOr<void> Function(ConfirmFirstLaunchEvent)
          confirmFirstLaunchEvent}) {
    assert(() {
      if (loadAppEvent == null &&
          changeLocaleEvent == null &&
          confirmFirstLaunchEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.LoadAppEvent:
        if (loadAppEvent == null) break;
        return loadAppEvent(this as LoadAppEvent);
      case _AppEvent.ChangeLocaleEvent:
        if (changeLocaleEvent == null) break;
        return changeLocaleEvent(this as ChangeLocaleEvent);
      case _AppEvent.ConfirmFirstLaunchEvent:
        if (confirmFirstLaunchEvent == null) break;
        return confirmFirstLaunchEvent(this as ConfirmFirstLaunchEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoadAppEvent extends AppEvent {
  const LoadAppEvent._() : super(_AppEvent.LoadAppEvent);

  factory LoadAppEvent() {
    _instance ??= LoadAppEvent._();
    return _instance;
  }

  static LoadAppEvent _instance;
}

@immutable
class ChangeLocaleEvent extends AppEvent {
  const ChangeLocaleEvent({@required this.locale})
      : super(_AppEvent.ChangeLocaleEvent);

  final String locale;

  @override
  String toString() => 'ChangeLocaleEvent(locale:${this.locale})';
  @override
  List get props => [locale];
}

@immutable
class ConfirmFirstLaunchEvent extends AppEvent {
  const ConfirmFirstLaunchEvent._() : super(_AppEvent.ConfirmFirstLaunchEvent);

  factory ConfirmFirstLaunchEvent() {
    _instance ??= ConfirmFirstLaunchEvent._();
    return _instance;
  }

  static ConfirmFirstLaunchEvent _instance;
}
