import 'package:arava/blocs/profile/event/profile_event.dart';
import 'package:arava/blocs/profile/state/profile_state.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/model/update_profile_request/update_profile_request.dart';
import 'package:arava/model/user/user.dart';
import 'package:arava/service/auth_service.dart';
import 'package:arava/service/session.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AuthService authService;
  final Session session;

  ProfileBloc({@required this.authService, @required this.session});

  @override
  ProfileState get initialState => ProfileState.profileUpdateIdleState();

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) {
    return event.when(
      updateProfileEvent: _updateProfile
    );
  }

  void updateProfile(UpdateProfileRequest request) {
    add(ProfileEvent.updateProfileEvent(request: request));
  }

  Stream<ProfileState> _updateProfile(UpdateProfileEvent event) async* {
    yield ProfileState.profileUpdateLoadingState();
    try {
      await authService.updateProfile(event.request);
      final newUser = User(
        firstName: event.request.firstName,
        lastName: event.request.lastName,
        email: event.request.email
      );
      await session.setUser(newUser);
      yield ProfileState.profileUpdateSuccessState();
    } on AppException catch (exception) {
      yield ProfileState.profileUpdateFailedState(exception: exception);
    }
  }
}