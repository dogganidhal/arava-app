// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class NavigationState extends Equatable {
  const NavigationState(this._type);

  factory NavigationState.navigatorState(
      {@required String route, @required int homeIndex}) = NavigatorState;

  final _NavigationState _type;

//ignore: missing_return
  R when<R>({@required R Function(NavigatorState) navigatorState}) {
    assert(() {
      if (navigatorState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationState.NavigatorState:
        return navigatorState(this as NavigatorState);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required FutureOr<R> Function(NavigatorState) navigatorState}) {
    assert(() {
      if (navigatorState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationState.NavigatorState:
        return navigatorState(this as NavigatorState);
    }
  }

  R whenOrElse<R>(
      {R Function(NavigatorState) navigatorState,
      @required R Function(NavigationState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationState.NavigatorState:
        if (navigatorState == null) break;
        return navigatorState(this as NavigatorState);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(NavigatorState) navigatorState,
      @required FutureOr<R> Function(NavigationState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationState.NavigatorState:
        if (navigatorState == null) break;
        return navigatorState(this as NavigatorState);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(NavigatorState) navigatorState}) {
    assert(() {
      if (navigatorState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationState.NavigatorState:
        if (navigatorState == null) break;
        return navigatorState(this as NavigatorState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class NavigatorState extends NavigationState {
  const NavigatorState({@required this.route, @required this.homeIndex})
      : super(_NavigationState.NavigatorState);

  final String route;

  final int homeIndex;

  @override
  String toString() =>
      'NavigatorState(route:${this.route},homeIndex:${this.homeIndex})';
  @override
  List get props => [route, homeIndex];
}
