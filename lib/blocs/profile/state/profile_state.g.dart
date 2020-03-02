// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_state.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileState extends Equatable {
  const ProfileState(this._type);

  factory ProfileState.profileUpdateIdleState() = ProfileUpdateIdleState;

  factory ProfileState.profileUpdateLoadingState() = ProfileUpdateLoadingState;

  factory ProfileState.profileUpdateSuccessState() = ProfileUpdateSuccessState;

  factory ProfileState.profileUpdateFailedState(
      {@required AppException exception}) = ProfileUpdateFailedState;

  final _ProfileState _type;

//ignore: missing_return
  R when<R>(
      {@required
          FutureOr<R> Function(ProfileUpdateIdleState) profileUpdateIdleState,
      @required
          FutureOr<R> Function(ProfileUpdateLoadingState)
              profileUpdateLoadingState,
      @required
          FutureOr<R> Function(ProfileUpdateSuccessState)
              profileUpdateSuccessState,
      @required
          FutureOr<R> Function(ProfileUpdateFailedState)
              profileUpdateFailedState}) {
    assert(() {
      if (profileUpdateIdleState == null ||
          profileUpdateLoadingState == null ||
          profileUpdateSuccessState == null ||
          profileUpdateFailedState == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.ProfileUpdateIdleState:
        return profileUpdateIdleState(this as ProfileUpdateIdleState);
      case _ProfileState.ProfileUpdateLoadingState:
        return profileUpdateLoadingState(this as ProfileUpdateLoadingState);
      case _ProfileState.ProfileUpdateSuccessState:
        return profileUpdateSuccessState(this as ProfileUpdateSuccessState);
      case _ProfileState.ProfileUpdateFailedState:
        return profileUpdateFailedState(this as ProfileUpdateFailedState);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(ProfileUpdateIdleState) profileUpdateIdleState,
      FutureOr<R> Function(ProfileUpdateLoadingState) profileUpdateLoadingState,
      FutureOr<R> Function(ProfileUpdateSuccessState) profileUpdateSuccessState,
      FutureOr<R> Function(ProfileUpdateFailedState) profileUpdateFailedState,
      @required FutureOr<R> Function(ProfileState) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.ProfileUpdateIdleState:
        if (profileUpdateIdleState == null) break;
        return profileUpdateIdleState(this as ProfileUpdateIdleState);
      case _ProfileState.ProfileUpdateLoadingState:
        if (profileUpdateLoadingState == null) break;
        return profileUpdateLoadingState(this as ProfileUpdateLoadingState);
      case _ProfileState.ProfileUpdateSuccessState:
        if (profileUpdateSuccessState == null) break;
        return profileUpdateSuccessState(this as ProfileUpdateSuccessState);
      case _ProfileState.ProfileUpdateFailedState:
        if (profileUpdateFailedState == null) break;
        return profileUpdateFailedState(this as ProfileUpdateFailedState);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(ProfileUpdateIdleState) profileUpdateIdleState,
      FutureOr<void> Function(ProfileUpdateLoadingState)
          profileUpdateLoadingState,
      FutureOr<void> Function(ProfileUpdateSuccessState)
          profileUpdateSuccessState,
      FutureOr<void> Function(ProfileUpdateFailedState)
          profileUpdateFailedState}) {
    assert(() {
      if (profileUpdateIdleState == null &&
          profileUpdateLoadingState == null &&
          profileUpdateSuccessState == null &&
          profileUpdateFailedState == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileState.ProfileUpdateIdleState:
        if (profileUpdateIdleState == null) break;
        return profileUpdateIdleState(this as ProfileUpdateIdleState);
      case _ProfileState.ProfileUpdateLoadingState:
        if (profileUpdateLoadingState == null) break;
        return profileUpdateLoadingState(this as ProfileUpdateLoadingState);
      case _ProfileState.ProfileUpdateSuccessState:
        if (profileUpdateSuccessState == null) break;
        return profileUpdateSuccessState(this as ProfileUpdateSuccessState);
      case _ProfileState.ProfileUpdateFailedState:
        if (profileUpdateFailedState == null) break;
        return profileUpdateFailedState(this as ProfileUpdateFailedState);
    }
  }

  @override
  List get props => const [];
}

@immutable
class ProfileUpdateIdleState extends ProfileState {
  const ProfileUpdateIdleState._()
      : super(_ProfileState.ProfileUpdateIdleState);

  factory ProfileUpdateIdleState() {
    _instance ??= ProfileUpdateIdleState._();
    return _instance;
  }

  static ProfileUpdateIdleState _instance;
}

@immutable
class ProfileUpdateLoadingState extends ProfileState {
  const ProfileUpdateLoadingState._()
      : super(_ProfileState.ProfileUpdateLoadingState);

  factory ProfileUpdateLoadingState() {
    _instance ??= ProfileUpdateLoadingState._();
    return _instance;
  }

  static ProfileUpdateLoadingState _instance;
}

@immutable
class ProfileUpdateSuccessState extends ProfileState {
  const ProfileUpdateSuccessState._()
      : super(_ProfileState.ProfileUpdateSuccessState);

  factory ProfileUpdateSuccessState() {
    _instance ??= ProfileUpdateSuccessState._();
    return _instance;
  }

  static ProfileUpdateSuccessState _instance;
}

@immutable
class ProfileUpdateFailedState extends ProfileState {
  const ProfileUpdateFailedState({@required this.exception})
      : super(_ProfileState.ProfileUpdateFailedState);

  final AppException exception;

  @override
  String toString() => 'ProfileUpdateFailedState(exception:${this.exception})';
  @override
  List get props => [exception];
}
