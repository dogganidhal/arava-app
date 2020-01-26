// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class NavigationEvent extends Equatable {
  const NavigationEvent(this._type);

  factory NavigationEvent.pop() = Pop;

  factory NavigationEvent.navigateToHome({@required int index}) =
      NavigateToHome;

  factory NavigationEvent.push({@required String route}) = Push;

  final _NavigationEvent _type;

//ignore: missing_return
  FutureOr<R> when<R>(
      {@required FutureOr<R> Function(Pop) pop,
      @required FutureOr<R> Function(NavigateToHome) navigateToHome,
      @required FutureOr<R> Function(Push) push}) {
    assert(() {
      if (pop == null || navigateToHome == null || push == null)
        throw 'check for all possible cases';
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.Pop:
        return pop(this as Pop);
      case _NavigationEvent.NavigateToHome:
        return navigateToHome(this as NavigateToHome);
      case _NavigationEvent.Push:
        return push(this as Push);
    }
  }

  FutureOr<R> whenOrElse<R>(
      {FutureOr<R> Function(Pop) pop,
      FutureOr<R> Function(NavigateToHome) navigateToHome,
      FutureOr<R> Function(Push) push,
      @required FutureOr<R> Function(NavigationEvent) orElse}) {
    assert(() {
      if (orElse == null) throw 'Missing orElse case';
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.Pop:
        if (pop == null) break;
        return pop(this as Pop);
      case _NavigationEvent.NavigateToHome:
        if (navigateToHome == null) break;
        return navigateToHome(this as NavigateToHome);
      case _NavigationEvent.Push:
        if (push == null) break;
        return push(this as Push);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(Pop) pop,
      FutureOr<void> Function(NavigateToHome) navigateToHome,
      FutureOr<void> Function(Push) push}) {
    assert(() {
      if (pop == null && navigateToHome == null && push == null)
        throw 'provide at least one branch';
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.Pop:
        if (pop == null) break;
        return pop(this as Pop);
      case _NavigationEvent.NavigateToHome:
        if (navigateToHome == null) break;
        return navigateToHome(this as NavigateToHome);
      case _NavigationEvent.Push:
        if (push == null) break;
        return push(this as Push);
    }
  }

  @override
  List get props => const [];
}

@immutable
class Pop extends NavigationEvent {
  const Pop._() : super(_NavigationEvent.Pop);

  factory Pop() {
    _instance ??= Pop._();
    return _instance;
  }

  static Pop _instance;
}

@immutable
class NavigateToHome extends NavigationEvent {
  const NavigateToHome({@required this.index})
      : super(_NavigationEvent.NavigateToHome);

  final int index;

  @override
  String toString() => 'NavigateToHome(index:${this.index})';
  @override
  List get props => [index];
}

@immutable
class Push extends NavigationEvent {
  const Push({@required this.route}) : super(_NavigationEvent.Push);

  final String route;

  @override
  String toString() => 'Push(route:${this.route})';
  @override
  List get props => [route];
}
