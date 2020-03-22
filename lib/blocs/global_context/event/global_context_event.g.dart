// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_context_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class GlobalContextEvent extends Equatable {
  const GlobalContextEvent(this._type);

  factory GlobalContextEvent.globalContextEditEvent(
      {@required GlobalContextState context}) = GlobalContextEditEvent;

  final _GlobalContextEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(GlobalContextEditEvent)
              globalContextEditEvent}) {
    assert(() {
      if (globalContextEditEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GlobalContextEvent.GlobalContextEditEvent:
        return globalContextEditEvent(this as GlobalContextEditEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(GlobalContextEditEvent) globalContextEditEvent,
      @required FutureOr<R> Function(GlobalContextEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GlobalContextEvent.GlobalContextEditEvent:
        if (globalContextEditEvent == null) break;
        return globalContextEditEvent(this as GlobalContextEditEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(GlobalContextEditEvent)
          globalContextEditEvent}) {
    assert(() {
      if (globalContextEditEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _GlobalContextEvent.GlobalContextEditEvent:
        if (globalContextEditEvent == null) break;
        return globalContextEditEvent(this as GlobalContextEditEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class GlobalContextEditEvent extends GlobalContextEvent {
  const GlobalContextEditEvent({@required this.context})
      : super(_GlobalContextEvent.GlobalContextEditEvent);

  final GlobalContextState context;

  @override
  String toString() => 'GlobalContextEditEvent(context:${this.context})';
  @override
  List get props => [context];
}
