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
  AuthState get initialState => AuthState.authAnonymousState();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) => event.when(
    loadAuthEvent: _loadAuth,
    logOutEvent: _logOut,
    tryLoginEvent: _tryLogin,
    trySignUpEvent: _trySignUp
  );

  void loadAuth() {
    add(AuthEvent.loadAuthEvent());
  }

  void logout() {
    add(AuthEvent.logOutEvent());
  }

  void tryLogin(String email, String password) {
    add(AuthEvent.tryLoginEvent(email: email, password: password));
  }

  void trySignUp({
    String email, String password,
    String firstName, String lastName
  }) {
    add(AuthEvent.trySignUpEvent(
      email: email, password: password,
      firstName: firstName, lastName: lastName
    ));
  }

  Stream<AuthState> _loadAuth(LoadAuthEvent event) async* {
    yield AuthState.authLoadingState();
    final persistedCredentials = await session.getCredentials();
    if (persistedCredentials != null) {
      final persistedUser = await session.getUser();
      yield AuthState.authAuthenticatedState(
        user: persistedUser,
        credentials: persistedCredentials
      );
      final userFromApi = await authService.getUser();
      await session.setUser(userFromApi);
      yield AuthState.authAuthenticatedState(
        user: userFromApi,
        credentials: persistedCredentials
      );
    } else {
      yield AuthState.authAnonymousState();
    }
  }

  Stream<AuthState> _logOut(LogOutEvent event) async* {
    yield AuthState.authLoadingState();
    await session.clearCredentials();
    await session.clearUser();
    yield AuthState.authAnonymousState();
  }

  Stream<AuthState> _tryLogin(TryLoginEvent event) async* {
    yield AuthState.authLoadingState();
    try {
      final credentials = await authService.login(event.email, event.password);
      await session.persistCredentials(credentials);
      final user = await authService.getUser();
      await session.setUser(user);
      yield AuthState.authAuthenticatedState(
        credentials: credentials,
        user: user
      );
    } on AppException catch (exception) {
      yield AuthState.authFailedState(exception: exception);
    }
  }

  Stream<AuthState> _trySignUp(TrySignUpEvent event) async* {
    yield AuthState.authLoadingState();
    try {
      final credentials = await authService.signUp(
        email: event.email, password: event.password,
        firstName: event.firstName,
        lastName: event.lastName
      );
      await session.persistCredentials(credentials);
      final user = await authService.getUser();
      await session.setUser(user);
      yield AuthState.authAuthenticatedState(
        credentials: credentials,
        user: user
      );
    } on AppException catch (exception) {
      yield AuthState.authFailedState(exception: exception);
    }
  }

}