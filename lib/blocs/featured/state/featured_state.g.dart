// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'featured_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class FeaturedState extends Equatable {
  const FeaturedState(this._type);

  factory FeaturedState.featuredLoadingState() = FeaturedLoadingState;

  factory FeaturedState.featuredReadyState(
      {@required List<Poi> featured,
      @required List<Poi> activities}) = FeaturedReadyState;

  factory FeaturedState.featuredFailingState(
      {@required AppException exception}) = FeaturedFailingState;

  final _FeaturedState _type;

//ignore: missing_return
  R when<R>(
      {@required R Function(FeaturedLoadingState) featuredLoadingState,
      @required R Function(FeaturedReadyState) featuredReadyState,
      @required R Function(FeaturedFailingState) featuredFailingState}) {
    assert(() {
      if (featuredLoadingState == null ||
          featuredReadyState == null ||
          featuredFailingState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedState.FeaturedLoadingState:
        return featuredLoadingState(this as FeaturedLoadingState);
      case _FeaturedState.FeaturedReadyState:
        return featuredReadyState(this as FeaturedReadyState);
      case _FeaturedState.FeaturedFailingState:
        return featuredFailingState(this as FeaturedFailingState);
    }
  }

//ignore: missing_return
  Future<R> asyncWhen<R>(
      {@required
          FutureOr<R> Function(FeaturedLoadingState) featuredLoadingState,
      @required
          FutureOr<R> Function(FeaturedReadyState) featuredReadyState,
      @required
          FutureOr<R> Function(FeaturedFailingState) featuredFailingState}) {
    assert(() {
      if (featuredLoadingState == null ||
          featuredReadyState == null ||
          featuredFailingState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedState.FeaturedLoadingState:
        return featuredLoadingState(this as FeaturedLoadingState);
      case _FeaturedState.FeaturedReadyState:
        return featuredReadyState(this as FeaturedReadyState);
      case _FeaturedState.FeaturedFailingState:
        return featuredFailingState(this as FeaturedFailingState);
    }
  }

  R whenOrElse<R>(
      {R Function(FeaturedLoadingState) featuredLoadingState,
      R Function(FeaturedReadyState) featuredReadyState,
      R Function(FeaturedFailingState) featuredFailingState,
      @required R Function(FeaturedState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedState.FeaturedLoadingState:
        if (featuredLoadingState == null) break;
        return featuredLoadingState(this as FeaturedLoadingState);
      case _FeaturedState.FeaturedReadyState:
        if (featuredReadyState == null) break;
        return featuredReadyState(this as FeaturedReadyState);
      case _FeaturedState.FeaturedFailingState:
        if (featuredFailingState == null) break;
        return featuredFailingState(this as FeaturedFailingState);
    }
    return orElse(this);
  }

  Future<R> asyncWhenOrElse<R>(
      {FutureOr<R> Function(FeaturedLoadingState) featuredLoadingState,
      FutureOr<R> Function(FeaturedReadyState) featuredReadyState,
      FutureOr<R> Function(FeaturedFailingState) featuredFailingState,
      @required FutureOr<R> Function(FeaturedState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedState.FeaturedLoadingState:
        if (featuredLoadingState == null) break;
        return featuredLoadingState(this as FeaturedLoadingState);
      case _FeaturedState.FeaturedReadyState:
        if (featuredReadyState == null) break;
        return featuredReadyState(this as FeaturedReadyState);
      case _FeaturedState.FeaturedFailingState:
        if (featuredFailingState == null) break;
        return featuredFailingState(this as FeaturedFailingState);
    }
    return orElse(this);
  }

//ignore: missing_return
  Future<void> whenPartial(
      {FutureOr<void> Function(FeaturedLoadingState) featuredLoadingState,
      FutureOr<void> Function(FeaturedReadyState) featuredReadyState,
      FutureOr<void> Function(FeaturedFailingState) featuredFailingState}) {
    assert(() {
      if (featuredLoadingState == null &&
          featuredReadyState == null &&
          featuredFailingState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _FeaturedState.FeaturedLoadingState:
        if (featuredLoadingState == null) break;
        return featuredLoadingState(this as FeaturedLoadingState);
      case _FeaturedState.FeaturedReadyState:
        if (featuredReadyState == null) break;
        return featuredReadyState(this as FeaturedReadyState);
      case _FeaturedState.FeaturedFailingState:
        if (featuredFailingState == null) break;
        return featuredFailingState(this as FeaturedFailingState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class FeaturedLoadingState extends FeaturedState {
  const FeaturedLoadingState._() : super(_FeaturedState.FeaturedLoadingState);

  factory FeaturedLoadingState() {
    _instance ??= const FeaturedLoadingState._();
    return _instance;
  }

  static FeaturedLoadingState _instance;
}

@immutable
class FeaturedReadyState extends FeaturedState {
  const FeaturedReadyState({@required this.featured, @required this.activities})
      : super(_FeaturedState.FeaturedReadyState);

  final List<Poi> featured;

  final List<Poi> activities;

  @override
  String toString() =>
      'FeaturedReadyState(featured:${this.featured},activities:${this.activities})';
  @override
  List get props => [featured, activities];
}

@immutable
class FeaturedFailingState extends FeaturedState {
  const FeaturedFailingState({@required this.exception})
      : super(_FeaturedState.FeaturedFailingState);

  final AppException exception;

  @override
  String toString() => 'FeaturedFailingState(exception:${this.exception})';
  @override
  List get props => [exception];
}
