// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_context_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class GlobalContextEvent extends Equatable {
  const GlobalContextEvent(this._type);

  factory GlobalContextEvent.globalContextSelectIslandEvent(
      {@required Island island}) = GlobalContextSelectIslandEvent;

  factory GlobalContextEvent.globalContextSetConfigurationEvent(
          {@required AppConfiguration configuration}) =
      GlobalContextSetConfigurationEvent;

  final _GlobalContextEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(GlobalContextSelectIslandEvent)
              globalContextSelectIslandEvent,
      @required
          FutureOr<R> Function(GlobalContextSetConfigurationEvent)
              globalContextSetConfigurationEvent}) {
    assert(() {
      if (globalContextSelectIslandEvent == null ||
          globalContextSetConfigurationEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _GlobalContextEvent.GlobalContextSelectIslandEvent:
        return globalContextSelectIslandEvent(
            this as GlobalContextSelectIslandEvent);
      case _GlobalContextEvent.GlobalContextSetConfigurationEvent:
        return globalContextSetConfigurationEvent(
            this as GlobalContextSetConfigurationEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(GlobalContextSelectIslandEvent)
          globalContextSelectIslandEvent,
      FutureOr<R> Function(GlobalContextSetConfigurationEvent)
          globalContextSetConfigurationEvent,
      @required FutureOr<R> Function(GlobalContextEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _GlobalContextEvent.GlobalContextSelectIslandEvent:
        if (globalContextSelectIslandEvent == null) break;
        return globalContextSelectIslandEvent(
            this as GlobalContextSelectIslandEvent);
      case _GlobalContextEvent.GlobalContextSetConfigurationEvent:
        if (globalContextSetConfigurationEvent == null) break;
        return globalContextSetConfigurationEvent(
            this as GlobalContextSetConfigurationEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(GlobalContextSelectIslandEvent)
          globalContextSelectIslandEvent,
      FutureOr<void> Function(GlobalContextSetConfigurationEvent)
          globalContextSetConfigurationEvent}) {
    assert(() {
      if (globalContextSelectIslandEvent == null &&
          globalContextSetConfigurationEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _GlobalContextEvent.GlobalContextSelectIslandEvent:
        if (globalContextSelectIslandEvent == null) break;
        return globalContextSelectIslandEvent(
            this as GlobalContextSelectIslandEvent);
      case _GlobalContextEvent.GlobalContextSetConfigurationEvent:
        if (globalContextSetConfigurationEvent == null) break;
        return globalContextSetConfigurationEvent(
            this as GlobalContextSetConfigurationEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class GlobalContextSelectIslandEvent extends GlobalContextEvent {
  const GlobalContextSelectIslandEvent({@required this.island})
      : super(_GlobalContextEvent.GlobalContextSelectIslandEvent);

  final Island island;

  @override
  String toString() => 'GlobalContextSelectIslandEvent(island:${this.island})';
  @override
  List get props => [island];
}

@immutable
class GlobalContextSetConfigurationEvent extends GlobalContextEvent {
  const GlobalContextSetConfigurationEvent({@required this.configuration})
      : super(_GlobalContextEvent.GlobalContextSetConfigurationEvent);

  final AppConfiguration configuration;

  @override
  String toString() =>
      'GlobalContextSetConfigurationEvent(configuration:${this.configuration})';
  @override
  List get props => [configuration];
}
