// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_event.dart';

// **************************************************************************
// SuperEnumGenerator
// **************************************************************************

@immutable
abstract class ProfileEvent extends Equatable {
  const ProfileEvent(this._type);

  factory ProfileEvent.updateProfileEvent(
      {@required UpdateProfileRequest request}) = UpdateProfileEvent;

  final _ProfileEvent _type;

//ignore: missing_return
  R when<R>(
      {@required FutureOr<R> Function(UpdateProfileEvent) updateProfileEvent}) {
    assert(() {
      if (updateProfileEvent == null) {
        throw 'check for all possible cases';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.UpdateProfileEvent:
        return updateProfileEvent(this as UpdateProfileEvent);
    }
  }

  R whenOrElse<R>(
      {FutureOr<R> Function(UpdateProfileEvent) updateProfileEvent,
      @required FutureOr<R> Function(ProfileEvent) orElse}) {
    assert(() {
      if (orElse == null) {
        throw 'Missing orElse case';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.UpdateProfileEvent:
        if (updateProfileEvent == null) break;
        return updateProfileEvent(this as UpdateProfileEvent);
    }
    return orElse(this);
  }

  FutureOr<void> whenPartial(
      {FutureOr<void> Function(UpdateProfileEvent) updateProfileEvent}) {
    assert(() {
      if (updateProfileEvent == null) {
        throw 'provide at least one branch';
      }
      return true;
    }());
    switch (this._type) {
      case _ProfileEvent.UpdateProfileEvent:
        if (updateProfileEvent == null) break;
        return updateProfileEvent(this as UpdateProfileEvent);
    }
  }

  @override
  List get props => const [];
}

@immutable
class UpdateProfileEvent extends ProfileEvent {
  const UpdateProfileEvent({@required this.request})
      : super(_ProfileEvent.UpdateProfileEvent);

  final UpdateProfileRequest request;

  @override
  String toString() => 'UpdateProfileEvent(request:${this.request})';
  @override
  List get props => [request];
}
