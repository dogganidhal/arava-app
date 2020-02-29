import 'package:arava/widgets/auth/login.dart';
import 'package:arava/widgets/auth/sign_up.dart';
import 'package:flutter/material.dart';


enum _AuthType {
  LOGIN, SIGN_UP
}

class Auth extends StatefulWidget {
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
      body: AnimatedSwitcher(
        key: _scaffoldBodyKey,
        duration: Duration(milliseconds: 200),
        child: _authType == _AuthType.LOGIN ? _login : _signUp
      ),
    );
  }
}