// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AppEvent extends Equatable {
  const AppEvent(this._type);

  factory AppEvent.loadApp() = LoadApp;

  factory AppEvent.changeLocale({@required String locale}) = ChangeLocale;

  factory AppEvent.confirmFirstLaunch() = ConfirmFirstLaunch;

  final _AppEvent _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(LoadApp) loadApp,
      @required FutureOr<R> Function(ChangeLocale) changeLocale,
      @required FutureOr<R> Function(ConfirmFirstLaunch) confirmFirstLaunch}) {
    assert(() {
      if (loadApp == null || changeLocale == null || confirmFirstLaunch == null)
        throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _AppEvent.LoadApp:
        return loadApp(this as LoadApp);
      case _AppEvent.ChangeLocale:
        return changeLocale(this as ChangeLocale);
      case _AppEvent.ConfirmFirstLaunch:
        return confirmFirstLaunch(this as ConfirmFirstLaunch);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(LoadApp) loadApp,
      FutureOr<R> Function(ChangeLocale) changeLocale,
      FutureOr<R> Function(ConfirmFirstLaunch) confirmFirstLaunch,
      @required FutureOr<R> Function(AppEvent) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _AppEvent.LoadApp:
        if (loadApp == null) break;
        return loadApp(this as LoadApp);
      case _AppEvent.ChangeLocale:
        if (changeLocale == null) break;
        return changeLocale(this as ChangeLocale);
      case _AppEvent.ConfirmFirstLaunch:
        if (confirmFirstLaunch == null) break;
        return confirmFirstLaunch(this as ConfirmFirstLaunch);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(LoadApp) loadApp,
      FutureOr<void> Function(ChangeLocale) changeLocale,
      FutureOr<void> Function(ConfirmFirstLaunch) confirmFirstLaunch}) {
    assert(() {
      if (loadApp == null && changeLocale == null && confirmFirstLaunch == null)
        throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _AppEvent.LoadApp:
        if (loadApp == null) break;
        return loadApp(this as LoadApp);
      case _AppEvent.ChangeLocale:
        if (changeLocale == null) break;
        return changeLocale(this as ChangeLocale);
      case _AppEvent.ConfirmFirstLaunch:
        if (confirmFirstLaunch == null) break;
        return confirmFirstLaunch(this as ConfirmFirstLaunch);
    }
  }

  @override
  List get props => const [];
}

@immutable
class LoadApp extends AppEvent {
  const LoadApp._() : super(_AppEvent.LoadApp);

  factory LoadApp() {
    _instance ??= LoadApp._();
    return _instance;
  }

  static LoadApp _instance;
}

@immutable
class ChangeLocale extends AppEvent {
  const ChangeLocale({@required this.locale}) : super(_AppEvent.ChangeLocale);

  final String locale;

  @override
  String toString() => 'ChangeLocale(locale:${this.locale})';
  @override
  List get props => [locale];
}

@immutable
class ConfirmFirstLaunch extends AppEvent {
  const ConfirmFirstLaunch._() : super(_AppEvent.ConfirmFirstLaunch);

  factory ConfirmFirstLaunch() {
    _instance ??= ConfirmFirstLaunch._();
    return _instance;
  }

  static ConfirmFirstLaunch _instance;
}
