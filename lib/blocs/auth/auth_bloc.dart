import 'package:arava/blocs/auth/event/auth_event.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/exception/app_exception.dart';
import 'package:arava/service/auth_service.dart';
import 'package:arava/service/session.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Session session;
  final AuthService authService;

  AuthBloc({@required this.session, @required this.authService});

  @override
  AuthState get initialState => AuthState.anonymous();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) => event.when(
    loadAuth: _loadAuth,
    logOut: _logOut,
    tryLogin: _tryLogin,
    trySignUp: _trySignUp
  );

  void loadAuth() {
    add(AuthEvent.loadAuth());
  }

  void logout() {
    add(AuthEvent.logOut());
  }

  void tryLogin(String email, String password) {
    add(AuthEvent.tryLogin(email: email, password: password));
  }

  void trySignUp({
    String email, String password,
    String firstName, String lastName
  }) {
    add(AuthEvent.trySignUp(
      email: email, password: password,
      firstName: firstName, lastName: lastName
    ));
  }

  Stream<AuthState> _loadAuth(LoadAuth event) async* {
    yield AuthState.loading();
    final persistedCredentials = await session.getCredentials();
    if (persistedCredentials != null) {
      final persistedUser = await session.getUser();
      yield AuthState.authenticated(
        user: persistedUser,
        credentials: persistedCredentials
      );
      final userFromApi = await authService.getUser();
      await session.setUser(userFromApi);
      yield AuthState.authenticated(
        user: userFromApi,
        credentials: persistedCredentials
      );
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
    yield AuthState.loading();
    try {
      final credentials = await authService.login(event.email, event.password);
      await session.persistCredentials(credentials);
      final user = await authService.getUser();
      yield AuthState.authenticated(
        credentials: credentials,
        user: user
      );
    } on AppException catch (exception) {
      yield AuthState.failed(exception: exception);
    }
  }

  Stream<AuthState> _trySignUp(TrySignUp event) async* {
    yield AuthState.loading();
    try {
      final credentials = await authService.signUp(
        email: event.email, password: event.password,
        firstName: event.firstName,
        lastName: event.lastName
      );
      await session.persistCredentials(credentials);
      final user = await authService.getUser();
      yield AuthState.authenticated(
        credentials: credentials,
        user: user
      );
    } on AppException catch (exception) {
      yield AuthState.failed(exception: exception);
    }
  }

}