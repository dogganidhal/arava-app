// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AppState extends Equatable {
  const AppState(this._type);

  factory AppState.loading() = Loading;

  factory AppState.unintialized() = Unintialized;

  factory AppState.firstLaunch({@required String language}) = FirstLaunch;

  factory AppState.appLoaded({@required AppConfiguration appConfiguration}) =
      AppLoaded;

  factory AppState.error({@required AppException exception}) = Error;

  final _AppState _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(Loading) loading,
      @required FutureOr<R> Function(Unintialized) unintialized,
      @required FutureOr<R> Function(FirstLaunch) firstLaunch,
      @required FutureOr<R> Function(AppLoaded) appLoaded,
      @required FutureOr<R> Function(Error) error}) {
    assert(() {
      if (loading == null ||
          unintialized == null ||
          firstLaunch == null ||
          appLoaded == null ||
          error == null) throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _AppState.Loading:
        return loading(this as Loading);
      case _AppState.Unintialized:
        return unintialized(this as Unintialized);
      case _AppState.FirstLaunch:
        return firstLaunch(this as FirstLaunch);
      case _AppState.AppLoaded:
        return appLoaded(this as AppLoaded);
      case _AppState.Error:
        return error(this as Error);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(Loading) loading,
      FutureOr<R> Function(Unintialized) unintialized,
      FutureOr<R> Function(FirstLaunch) firstLaunch,
      FutureOr<R> Function(AppLoaded) appLoaded,
      FutureOr<R> Function(Error) error,
      @required FutureOr<R> Function(AppState) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _AppState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _AppState.Unintialized:
        if (unintialized == null) break;
        return unintialized(this as Unintialized);
      case _AppState.FirstLaunch:
        if (firstLaunch == null) break;
        return firstLaunch(this as FirstLaunch);
      case _AppState.AppLoaded:
        if (appLoaded == null) break;
        return appLoaded(this as AppLoaded);
      case _AppState.Error:
        if (error == null) break;
        return error(this as Error);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(Loading) loading,
      FutureOr<void> Function(Unintialized) unintialized,
      FutureOr<void> Function(FirstLaunch) firstLaunch,
      FutureOr<void> Function(AppLoaded) appLoaded,
      FutureOr<void> Function(Error) error}) {
    assert(() {
      if (loading == null &&
          unintialized == null &&
          firstLaunch == null &&
          appLoaded == null &&
          error == null) throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _AppState.Loading:
        if (loading == null) break;
        return loading(this as Loading);
      case _AppState.Unintialized:
        if (unintialized == null) break;
        return unintialized(this as Unintialized);
      case _AppState.FirstLaunch:
        if (firstLaunch == null) break;
        return firstLaunch(this as FirstLaunch);
      case _AppState.AppLoaded:
        if (appLoaded == null) break;
        return appLoaded(this as AppLoaded);
      case _AppState.Error:
        if (error == null) break;
        return error(this as Error);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Loading extends AppState {
  const Loading._() : super(_AppState.Loading);

  factory Loading() {
    _instance ??= Loading._();
    return _instance;
  }

  static Loading _instance;
}

@immutable
class Unintialized extends AppState {
  const Unintialized._() : super(_AppState.Unintialized);

  factory Unintialized() {
    _instance ??= Unintialized._();
    return _instance;
  }

  static Unintialized _instance;
}

@immutable
class FirstLaunch extends AppState {
  const FirstLaunch({@required this.language}) : super(_AppState.FirstLaunch);

  final String language;

  @override
  String toString() => 'FirstLaunch(language:${this.language})';
  @override
  List get props => [language];
}

@immutable
class AppLoaded extends AppState {
  const AppLoaded({@required this.appConfiguration})
      : super(_AppState.AppLoaded);

  final AppConfiguration appConfiguration;

  @override
  String toString() => 'AppLoaded(appConfiguration:${this.appConfiguration})';
  @override
  List get props => [appConfiguration];
}

@immutable
class Error extends AppState {
  const Error({@required this.exception}) : super(_AppState.Error);

  final AppException exception;

  @override
  String toString() => 'Error(exception:${this.exception})';
  @override
  List get props => [exception];
}
