// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class FeaturedEvent extends Equatable {
  const FeaturedEvent(this._type);

  factory FeaturedEvent.featuredLoadSponsoredEvent({@required Island island}) =
      FeaturedLoadSponsoredEvent;

  factory FeaturedEvent.featuredLoadActivitiesEvent({@required Island island}) =
      FeaturedLoadActivitiesEvent;

  final _FeaturedEvent _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(FeaturedLoadSponsoredEvent)
              featuredLoadSponsoredEvent,
      @required
          FutureOr<R> Function(FeaturedLoadActivitiesEvent)
              featuredLoadActivitiesEvent}) {
    assert(() {
      if (featuredLoadSponsoredEvent == null ||
          featuredLoadActivitiesEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedEvent.FeaturedLoadSponsoredEvent:
        return featuredLoadSponsoredEvent(this as FeaturedLoadSponsoredEvent);
      case _FeaturedEvent.FeaturedLoadActivitiesEvent:
        return featuredLoadActivitiesEvent(this as FeaturedLoadActivitiesEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(FeaturedLoadSponsoredEvent)
          featuredLoadSponsoredEvent,
      FutureOr<R> Function(FeaturedLoadActivitiesEvent)
          featuredLoadActivitiesEvent,
      @required FutureOr<R> Function(FeaturedEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedEvent.FeaturedLoadSponsoredEvent:
        if (featuredLoadSponsoredEvent == null) break;
        return featuredLoadSponsoredEvent(this as FeaturedLoadSponsoredEvent);
      case _FeaturedEvent.FeaturedLoadActivitiesEvent:
        if (featuredLoadActivitiesEvent == null) break;
        return featuredLoadActivitiesEvent(this as FeaturedLoadActivitiesEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(FeaturedLoadSponsoredEvent)
          featuredLoadSponsoredEvent,
      FutureOr<void> Function(FeaturedLoadActivitiesEvent)
          featuredLoadActivitiesEvent}) {
    assert(() {
      if (featuredLoadSponsoredEvent == null &&
          featuredLoadActivitiesEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedEvent.FeaturedLoadSponsoredEvent:
        if (featuredLoadSponsoredEvent == null) break;
        return featuredLoadSponsoredEvent(this as FeaturedLoadSponsoredEvent);
      case _FeaturedEvent.FeaturedLoadActivitiesEvent:
        if (featuredLoadActivitiesEvent == null) break;
        return featuredLoadActivitiesEvent(this as FeaturedLoadActivitiesEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class FeaturedLoadSponsoredEvent extends FeaturedEvent {
  const FeaturedLoadSponsoredEvent({@required this.island})
      : super(_FeaturedEvent.FeaturedLoadSponsoredEvent);

  final Island island;

  @override
  String toString() => 'FeaturedLoadSponsoredEvent(island:${this.island})';
  @override
  List get props => [island];
}

@immutable
class FeaturedLoadActivitiesEvent extends FeaturedEvent {
  const FeaturedLoadActivitiesEvent({@required this.island})
      : super(_FeaturedEvent.FeaturedLoadActivitiesEvent);

  final Island island;

  @override
  String toString() => 'FeaturedLoadActivitiesEvent(island:${this.island})';
  @override
  List get props => [island];
}
