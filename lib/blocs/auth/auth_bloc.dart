import 'package:arava/blocs/auth/event/auth_event.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/service/auth_service.dart';
import 'package:arava/service/session.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Session session;
  final AuthService authService;

  AuthBloc({@required this.session, @required this.authService});

  @override
  AuthState get initialState => AuthState.loading();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) => event.when(
    loadAuth: _loadAuth,
    logOut: _logOut,
    tryLogin: _tryLogin,
    trySignUp: _trySignUp
  );

  Stream<AuthState> _loadAuth(LoadAuth event) async* {
    yield AuthState.loading();
    final persistedCredentials = await session.getCredentials();
    if (persistedCredentials != null) {
      final persistedUser = await session.getUser();
      yield AuthState.authenticated(user: persistedUser);
      final userFromApi = await authService.getUser();
      await session.setUser(userFromApi);
      yield AuthState.authenticated(user: userFromApi);
    } else {
      yield AuthState.anonymous();
    }
  }

  Stream<AuthState> _logOut(LogOut event) async* {
    yield AuthState.loading();
    await session.clearCredentials();
    await session.clearUser();
    yield AuthState.anonymous();
  }

  Stream<AuthState> _tryLogin(TryLogin event) async* {

  }

  Stream<AuthState> _trySignUp(TrySignUp event) async* {

  }

}