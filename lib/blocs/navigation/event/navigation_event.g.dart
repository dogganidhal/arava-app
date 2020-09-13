// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'navigation_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class NavigationEvent extends Equatable {
  const NavigationEvent(this._type);

  factory NavigationEvent.navigationPopEvent() = NavigationPopEvent;

  factory NavigationEvent.navigationPopWithValueEvent(
      {@required dynamic value}) = NavigationPopWithValueEvent;

  factory NavigationEvent.navigateToHomeEvent({@required int index}) =
      NavigateToHomeEvent;

  factory NavigationEvent.navigationPushEvent({@required String route}) =
      NavigationPushEvent;

  final _NavigationEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          R Function(NavigationPopEvent) navigationPopEvent,
      @required
          R Function(NavigationPopWithValueEvent) navigationPopWithValueEvent,
      @required
          R Function(NavigateToHomeEvent) navigateToHomeEvent,
      @required
          R Function(NavigationPushEvent) navigationPushEvent}) {
    assert(() {
      if (navigationPopEvent == null ||
          navigationPopWithValueEvent == null ||
          navigateToHomeEvent == null ||
          navigationPushEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.NavigationPopEvent:
        return navigationPopEvent(this as NavigationPopEvent);
      case _NavigationEvent.NavigationPopWithValueEvent:
        return navigationPopWithValueEvent(this as NavigationPopWithValueEvent);
      case _NavigationEvent.NavigateToHomeEvent:
        return navigateToHomeEvent(this as NavigateToHomeEvent);
      case _NavigationEvent.NavigationPushEvent:
        return navigationPushEvent(this as NavigationPushEvent);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required
          FutureOr<R> Function(NavigationPopEvent) navigationPopEvent,
      @required
          FutureOr<R> Function(NavigationPopWithValueEvent)
              navigationPopWithValueEvent,
      @required
          FutureOr<R> Function(NavigateToHomeEvent) navigateToHomeEvent,
      @required
          FutureOr<R> Function(NavigationPushEvent) navigationPushEvent}) {
    assert(() {
      if (navigationPopEvent == null ||
          navigationPopWithValueEvent == null ||
          navigateToHomeEvent == null ||
          navigationPushEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.NavigationPopEvent:
        return navigationPopEvent(this as NavigationPopEvent);
      case _NavigationEvent.NavigationPopWithValueEvent:
        return navigationPopWithValueEvent(this as NavigationPopWithValueEvent);
      case _NavigationEvent.NavigateToHomeEvent:
        return navigateToHomeEvent(this as NavigateToHomeEvent);
      case _NavigationEvent.NavigationPushEvent:
        return navigationPushEvent(this as NavigationPushEvent);
    }
  }

  R whenOrElse<R>(
      {R Function(NavigationPopEvent) navigationPopEvent,
      R Function(NavigationPopWithValueEvent) navigationPopWithValueEvent,
      R Function(NavigateToHomeEvent) navigateToHomeEvent,
      R Function(NavigationPushEvent) navigationPushEvent,
      @required R Function(NavigationEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.NavigationPopEvent:
        if (navigationPopEvent == null) break;
        return navigationPopEvent(this as NavigationPopEvent);
      case _NavigationEvent.NavigationPopWithValueEvent:
        if (navigationPopWithValueEvent == null) break;
        return navigationPopWithValueEvent(this as NavigationPopWithValueEvent);
      case _NavigationEvent.NavigateToHomeEvent:
        if (navigateToHomeEvent == null) break;
        return navigateToHomeEvent(this as NavigateToHomeEvent);
      case _NavigationEvent.NavigationPushEvent:
        if (navigationPushEvent == null) break;
        return navigationPushEvent(this as NavigationPushEvent);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(NavigationPopEvent) navigationPopEvent,
      FutureOr<R> Function(NavigationPopWithValueEvent)
          navigationPopWithValueEvent,
      FutureOr<R> Function(NavigateToHomeEvent) navigateToHomeEvent,
      FutureOr<R> Function(NavigationPushEvent) navigationPushEvent,
      @required FutureOr<R> Function(NavigationEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.NavigationPopEvent:
        if (navigationPopEvent == null) break;
        return navigationPopEvent(this as NavigationPopEvent);
      case _NavigationEvent.NavigationPopWithValueEvent:
        if (navigationPopWithValueEvent == null) break;
        return navigationPopWithValueEvent(this as NavigationPopWithValueEvent);
      case _NavigationEvent.NavigateToHomeEvent:
        if (navigateToHomeEvent == null) break;
        return navigateToHomeEvent(this as NavigateToHomeEvent);
      case _NavigationEvent.NavigationPushEvent:
        if (navigationPushEvent == null) break;
        return navigationPushEvent(this as NavigationPushEvent);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(NavigationPopEvent) navigationPopEvent,
      FutureOr<void> Function(NavigationPopWithValueEvent)
          navigationPopWithValueEvent,
      FutureOr<void> Function(NavigateToHomeEvent) navigateToHomeEvent,
      FutureOr<void> Function(NavigationPushEvent) navigationPushEvent}) {
    assert(() {
      if (navigationPopEvent == null &&
          navigationPopWithValueEvent == null &&
          navigateToHomeEvent == null &&
          navigationPushEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _NavigationEvent.NavigationPopEvent:
        if (navigationPopEvent == null) break;
        return navigationPopEvent(this as NavigationPopEvent);
      case _NavigationEvent.NavigationPopWithValueEvent:
        if (navigationPopWithValueEvent == null) break;
        return navigationPopWithValueEvent(this as NavigationPopWithValueEvent);
      case _NavigationEvent.NavigateToHomeEvent:
        if (navigateToHomeEvent == null) break;
        return navigateToHomeEvent(this as NavigateToHomeEvent);
      case _NavigationEvent.NavigationPushEvent:
        if (navigationPushEvent == null) break;
        return navigationPushEvent(this as NavigationPushEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class NavigationPopEvent extends NavigationEvent {
  const NavigationPopEvent._() : super(_NavigationEvent.NavigationPopEvent);

  factory NavigationPopEvent() {
    _instance ??= const NavigationPopEvent._();
    return _instance;
  }

  static NavigationPopEvent _instance;
}

@immutable
class NavigationPopWithValueEvent extends NavigationEvent {
  const NavigationPopWithValueEvent({@required this.value})
      : super(_NavigationEvent.NavigationPopWithValueEvent);

  final dynamic value;

  @override
  String toString() => 'NavigationPopWithValueEvent(value:${this.value})';
  @override
  List get props => [value];
}

@immutable
class NavigateToHomeEvent extends NavigationEvent {
  const NavigateToHomeEvent({@required this.index})
      : super(_NavigationEvent.NavigateToHomeEvent);

  final int index;

  @override
  String toString() => 'NavigateToHomeEvent(index:${this.index})';
  @override
  List get props => [index];
}

@immutable
class NavigationPushEvent extends NavigationEvent {
  const NavigationPushEvent({@required this.route})
      : super(_NavigationEvent.NavigationPushEvent);

  final String route;

  @override
  String toString() => 'NavigationPushEvent(route:${this.route})';
  @override
  List get props => [route];
}
