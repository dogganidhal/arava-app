import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/model/user/user.dart';
import 'package:arava/widgets/auth/login.dart';
import 'package:arava/widgets/auth/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


enum _AuthType {
  LOGIN, SIGN_UP
}

typedef void PostAuthenticationCallback(User user);

class Auth extends StatefulWidget {
  final PostAuthenticationCallback onAuthenticationSuccessful;

  const Auth({Key key, this.onAuthenticationSuccessful}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  final GlobalKey _scaffoldBodyKey = GlobalKey();

  _AuthType _authType = _AuthType.LOGIN;
  Login _login;
  SignUp _signUp;

  @override
  void initState() {
    super.initState();
    _login = Login(
      onSignUpButtonTapped: () {
        setState(() => _authType = _AuthType.SIGN_UP);
      },
    );
    _signUp = SignUp(
      onLoginButtonTapped: () {
        setState(() => _authType = _AuthType.LOGIN);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: Modular.get<AuthBloc>(),
        listener: (context, state) {
          state.whenPartial(
            authenticated: (authenticatedState) {
              widget.onAuthenticationSuccessful(authenticatedState.user);
            }
          );
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          bloc: Modular.get<AuthBloc>(),
          builder: (context, state) => AnimatedSwitcher(
            key: _scaffoldBodyKey,
            duration: Duration(milliseconds: 200),
            child: _authType == _AuthType.LOGIN ? _login : _signUp
          ),
        ),
      ),
    );
  }
}