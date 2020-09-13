// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class AppState extends Equatable {
  const AppState(this._type);

  factory AppState.appLoadingState() = AppLoadingState;

  factory AppState.appUnintializedState() = AppUnintializedState;

  factory AppState.appFirstLaunchState({@required String language}) =
      AppFirstLaunchState;

  factory AppState.appLoadedState(
      {@required AppConfiguration appConfiguration}) = AppLoadedState;

  factory AppState.appErrorState({@required AppException exception}) =
      AppErrorState;

  final _AppState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(AppLoadingState) appLoadingState,
      @required R Function(AppUnintializedState) appUnintializedState,
      @required R Function(AppFirstLaunchState) appFirstLaunchState,
      @required R Function(AppLoadedState) appLoadedState,
      @required R Function(AppErrorState) appErrorState}) {
    assert(() {
      if (appLoadingState == null ||
          appUnintializedState == null ||
          appFirstLaunchState == null ||
          appLoadedState == null ||
          appErrorState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AppState.AppLoadingState:
        return appLoadingState(this as AppLoadingState);
      case _AppState.AppUnintializedState:
        return appUnintializedState(this as AppUnintializedState);
      case _AppState.AppFirstLaunchState:
        return appFirstLaunchState(this as AppFirstLaunchState);
      case _AppState.AppLoadedState:
        return appLoadedState(this as AppLoadedState);
      case _AppState.AppErrorState:
        return appErrorState(this as AppErrorState);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(AppLoadingState) appLoadingState,
      @required FutureOr<R> Function(AppUnintializedState) appUnintializedState,
      @required FutureOr<R> Function(AppFirstLaunchState) appFirstLaunchState,
      @required FutureOr<R> Function(AppLoadedState) appLoadedState,
      @required FutureOr<R> Function(AppErrorState) appErrorState}) {
    assert(() {
      if (appLoadingState == null ||
          appUnintializedState == null ||
          appFirstLaunchState == null ||
          appLoadedState == null ||
          appErrorState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _AppState.AppLoadingState:
        return appLoadingState(this as AppLoadingState);
      case _AppState.AppUnintializedState:
        return appUnintializedState(this as AppUnintializedState);
      case _AppState.AppFirstLaunchState:
        return appFirstLaunchState(this as AppFirstLaunchState);
      case _AppState.AppLoadedState:
        return appLoadedState(this as AppLoadedState);
      case _AppState.AppErrorState:
        return appErrorState(this as AppErrorState);
    }
  }

  R whenOrElse<R>(
      {R Function(AppLoadingState) appLoadingState,
      R Function(AppUnintializedState) appUnintializedState,
      R Function(AppFirstLaunchState) appFirstLaunchState,
      R Function(AppLoadedState) appLoadedState,
      R Function(AppErrorState) appErrorState,
      @required R Function(AppState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AppState.AppLoadingState:
        if (appLoadingState == null) break;
        return appLoadingState(this as AppLoadingState);
      case _AppState.AppUnintializedState:
        if (appUnintializedState == null) break;
        return appUnintializedState(this as AppUnintializedState);
      case _AppState.AppFirstLaunchState:
        if (appFirstLaunchState == null) break;
        return appFirstLaunchState(this as AppFirstLaunchState);
      case _AppState.AppLoadedState:
        if (appLoadedState == null) break;
        return appLoadedState(this as AppLoadedState);
      case _AppState.AppErrorState:
        if (appErrorState == null) break;
        return appErrorState(this as AppErrorState);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(AppLoadingState) appLoadingState,
      FutureOr<R> Function(AppUnintializedState) appUnintializedState,
      FutureOr<R> Function(AppFirstLaunchState) appFirstLaunchState,
      FutureOr<R> Function(AppLoadedState) appLoadedState,
      FutureOr<R> Function(AppErrorState) appErrorState,
      @required FutureOr<R> Function(AppState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _AppState.AppLoadingState:
        if (appLoadingState == null) break;
        return appLoadingState(this as AppLoadingState);
      case _AppState.AppUnintializedState:
        if (appUnintializedState == null) break;
        return appUnintializedState(this as AppUnintializedState);
      case _AppState.AppFirstLaunchState:
        if (appFirstLaunchState == null) break;
        return appFirstLaunchState(this as AppFirstLaunchState);
      case _AppState.AppLoadedState:
        if (appLoadedState == null) break;
        return appLoadedState(this as AppLoadedState);
      case _AppState.AppErrorState:
        if (appErrorState == null) break;
        return appErrorState(this as AppErrorState);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(AppLoadingState) appLoadingState,
      FutureOr<void> Function(AppUnintializedState) appUnintializedState,
      FutureOr<void> Function(AppFirstLaunchState) appFirstLaunchState,
      FutureOr<void> Function(AppLoadedState) appLoadedState,
      FutureOr<void> Function(AppErrorState) appErrorState}) {
    assert(() {
      if (appLoadingState == null &&
          appUnintializedState == null &&
          appFirstLaunchState == null &&
          appLoadedState == null &&
          appErrorState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _AppState.AppLoadingState:
        if (appLoadingState == null) break;
        return appLoadingState(this as AppLoadingState);
      case _AppState.AppUnintializedState:
        if (appUnintializedState == null) break;
        return appUnintializedState(this as AppUnintializedState);
      case _AppState.AppFirstLaunchState:
        if (appFirstLaunchState == null) break;
        return appFirstLaunchState(this as AppFirstLaunchState);
      case _AppState.AppLoadedState:
        if (appLoadedState == null) break;
        return appLoadedState(this as AppLoadedState);
      case _AppState.AppErrorState:
        if (appErrorState == null) break;
        return appErrorState(this as AppErrorState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class AppLoadingState extends AppState {
  const AppLoadingState._() : super(_AppState.AppLoadingState);

  factory AppLoadingState() {
    _instance ??= const AppLoadingState._();
    return _instance;
  }

  static AppLoadingState _instance;
}

@immutable
class AppUnintializedState extends AppState {
  const AppUnintializedState._() : super(_AppState.AppUnintializedState);

  factory AppUnintializedState() {
    _instance ??= const AppUnintializedState._();
    return _instance;
  }

  static AppUnintializedState _instance;
}

@immutable
class AppFirstLaunchState extends AppState {
  const AppFirstLaunchState({@required this.language})
      : super(_AppState.AppFirstLaunchState);

  final String language;

  @override
  String toString() => 'AppFirstLaunchState(language:${this.language})';
  @override
  List get props => [language];
}

@immutable
class AppLoadedState extends AppState {
  const AppLoadedState({@required this.appConfiguration})
      : super(_AppState.AppLoadedState);

  final AppConfiguration appConfiguration;

  @override
  String toString() =>
      'AppLoadedState(appConfiguration:${this.appConfiguration})';
  @override
  List get props => [appConfiguration];
}

@immutable
class AppErrorState extends AppState {
  const AppErrorState({@required this.exception})
      : super(_AppState.AppErrorState);

  final AppException exception;

  @override
  String toString() => 'AppErrorState(exception:${this.exception})';
  @override
  List get props => [exception];
}
