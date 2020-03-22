// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class FeaturedEvent extends Equatable {
  const FeaturedEvent(this._type);

  factory FeaturedEvent.featuredLoadEvent({@required Island island}) =
      FeaturedLoadEvent;

  final _FeaturedEvent _type;

//ignore: missing_return
  R when<R>(
      {@required FutureOr<R> Function(FeaturedLoadEvent) featuredLoadEvent}) {
    assert(() {
      if (featuredLoadEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedEvent.FeaturedLoadEvent:
        return featuredLoadEvent(this as FeaturedLoadEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(FeaturedLoadEvent) featuredLoadEvent,
      @required FutureOr<R> Function(FeaturedEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedEvent.FeaturedLoadEvent:
        if (featuredLoadEvent == null) break;
        return featuredLoadEvent(this as FeaturedLoadEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(FeaturedLoadEvent) featuredLoadEvent}) {
    assert(() {
      if (featuredLoadEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedEvent.FeaturedLoadEvent:
        if (featuredLoadEvent == null) break;
        return featuredLoadEvent(this as FeaturedLoadEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class FeaturedLoadEvent extends FeaturedEvent {
  const FeaturedLoadEvent({@required this.island})
      : super(_FeaturedEvent.FeaturedLoadEvent);

  final Island island;

  @override
  String toString() => 'FeaturedLoadEvent(island:${this.island})';
  @override
  List get props => [island];
}
