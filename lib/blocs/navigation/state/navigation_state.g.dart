// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class NavigationState extends Equatable {
  const NavigationState(this._type);

  factory NavigationState.navigator({@required String route}) = Navigator;

  final _NavigationState _type;

//ignore: missing_return
  FutureOr<R> when<R>({@required FutureOr<R> Function(Navigator) navigator}) {
    assert(() {
      if (navigator == null) throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _NavigationState.Navigator:
        return navigator(this as Navigator);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(Navigator) navigator,
      @required FutureOr<R> Function(NavigationState) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _NavigationState.Navigator:
        if (navigator == null) break;
        return navigator(this as Navigator);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial({FutureOr<void> Function(Navigator) navigator}) {
    assert(() {
      if (navigator == null) throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _NavigationState.Navigator:
        if (navigator == null) break;
        return navigator(this as Navigator);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Navigator extends NavigationState {
  const Navigator({@required this.route}) : super(_NavigationState.Navigator);

  final String route;

  @override
  String toString() => 'Navigator(route:${this.route})';
  @override
  List get props => [route];
}
