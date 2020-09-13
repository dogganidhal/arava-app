// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent(this._type);

  factory AppEvent.appLoadEvent() = AppLoadEvent;

  factory AppEvent.appChangeLocaleEvent({@required String locale}) =
      AppChangeLocaleEvent;

  factory AppEvent.appConfirmFirstLaunchEvent() = AppConfirmFirstLaunchEvent;

  final _AppEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(AppLoadEvent) appLoadEvent,
      @required
          R Function(AppChangeLocaleEvent) appChangeLocaleEvent,
      @required
          R Function(AppConfirmFirstLaunchEvent) appConfirmFirstLaunchEvent}) {
    assert(() {
      if (appLoadEvent == null ||
          appChangeLocaleEvent == null ||
          appConfirmFirstLaunchEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.AppLoadEvent:
        return appLoadEvent(this as AppLoadEvent);
      case _AppEvent.AppChangeLocaleEvent:
        return appChangeLocaleEvent(this as AppChangeLocaleEvent);
      case _AppEvent.AppConfirmFirstLaunchEvent:
        return appConfirmFirstLaunchEvent(this as AppConfirmFirstLaunchEvent);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required
          FutureOr<R> Function(AppLoadEvent) appLoadEvent,
      @required
          FutureOr<R> Function(AppChangeLocaleEvent) appChangeLocaleEvent,
      @required
          FutureOr<R> Function(AppConfirmFirstLaunchEvent)
              appConfirmFirstLaunchEvent}) {
    assert(() {
      if (appLoadEvent == null ||
          appChangeLocaleEvent == null ||
          appConfirmFirstLaunchEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.AppLoadEvent:
        return appLoadEvent(this as AppLoadEvent);
      case _AppEvent.AppChangeLocaleEvent:
        return appChangeLocaleEvent(this as AppChangeLocaleEvent);
      case _AppEvent.AppConfirmFirstLaunchEvent:
        return appConfirmFirstLaunchEvent(this as AppConfirmFirstLaunchEvent);
    }
  }

  R whenOrElse<R>(
      {R Function(AppLoadEvent) appLoadEvent,
      R Function(AppChangeLocaleEvent) appChangeLocaleEvent,
      R Function(AppConfirmFirstLaunchEvent) appConfirmFirstLaunchEvent,
      @required R Function(AppEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.AppLoadEvent:
        if (appLoadEvent == null) break;
        return appLoadEvent(this as AppLoadEvent);
      case _AppEvent.AppChangeLocaleEvent:
        if (appChangeLocaleEvent == null) break;
        return appChangeLocaleEvent(this as AppChangeLocaleEvent);
      case _AppEvent.AppConfirmFirstLaunchEvent:
        if (appConfirmFirstLaunchEvent == null) break;
        return appConfirmFirstLaunchEvent(this as AppConfirmFirstLaunchEvent);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(AppLoadEvent) appLoadEvent,
      FutureOr<R> Function(AppChangeLocaleEvent) appChangeLocaleEvent,
      FutureOr<R> Function(AppConfirmFirstLaunchEvent)
          appConfirmFirstLaunchEvent,
      @required FutureOr<R> Function(AppEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.AppLoadEvent:
        if (appLoadEvent == null) break;
        return appLoadEvent(this as AppLoadEvent);
      case _AppEvent.AppChangeLocaleEvent:
        if (appChangeLocaleEvent == null) break;
        return appChangeLocaleEvent(this as AppChangeLocaleEvent);
      case _AppEvent.AppConfirmFirstLaunchEvent:
        if (appConfirmFirstLaunchEvent == null) break;
        return appConfirmFirstLaunchEvent(this as AppConfirmFirstLaunchEvent);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(AppLoadEvent) appLoadEvent,
      FutureOr<void> Function(AppChangeLocaleEvent) appChangeLocaleEvent,
      FutureOr<void> Function(AppConfirmFirstLaunchEvent)
          appConfirmFirstLaunchEvent}) {
    assert(() {
      if (appLoadEvent == null &&
          appChangeLocaleEvent == null &&
          appConfirmFirstLaunchEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AppEvent.AppLoadEvent:
        if (appLoadEvent == null) break;
        return appLoadEvent(this as AppLoadEvent);
      case _AppEvent.AppChangeLocaleEvent:
        if (appChangeLocaleEvent == null) break;
        return appChangeLocaleEvent(this as AppChangeLocaleEvent);
      case _AppEvent.AppConfirmFirstLaunchEvent:
        if (appConfirmFirstLaunchEvent == null) break;
        return appConfirmFirstLaunchEvent(this as AppConfirmFirstLaunchEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class AppLoadEvent extends AppEvent {
  const AppLoadEvent._() : super(_AppEvent.AppLoadEvent);

  factory AppLoadEvent() {
    _instance ??= const AppLoadEvent._();
    return _instance;
  }

  static AppLoadEvent _instance;
}

@immutable
class AppChangeLocaleEvent extends AppEvent {
  const AppChangeLocaleEvent({@required this.locale})
      : super(_AppEvent.AppChangeLocaleEvent);

  final String locale;

  @override
  String toString() => 'AppChangeLocaleEvent(locale:${this.locale})';
  @override
  List get props => [locale];
}

@immutable
class AppConfirmFirstLaunchEvent extends AppEvent {
  const AppConfirmFirstLaunchEvent._()
      : super(_AppEvent.AppConfirmFirstLaunchEvent);

  factory AppConfirmFirstLaunchEvent() {
    _instance ??= const AppConfirmFirstLaunchEvent._();
    return _instance;
  }

  static AppConfirmFirstLaunchEvent _instance;
}
