import 'package:arava/model/user/user.dart';
import 'package:arava/widgets/auth/auth.dart';
import 'package:arava/widgets/auth/auth_listener.dart';
import 'package:flutter/material.dart';

class AuthRequired extends StatefulWidget {
  final AuthenticatedWidgetBuilder authenticatedBuilder;
  final String anonymousDescription;

  const AuthRequired({
    Key key, this.authenticatedBuilder, this.anonymousDescription
  }) : super(key: key);

  @override
  _AuthRequiredState createState() => _AuthRequiredState();
}

class _AuthRequiredState extends State<AuthRequired> {
  User _user;

  @override
  Widget build(BuildContext context) {
    return AuthListener(
      loaderBuilder: (context) => CircularProgressIndicator(),
      anonymousBuilder: (context) => _user != null ?
        widget.authenticatedBuilder(context, _user) :
        Auth(
          onAuthenticationSuccessful: (user) => setState(() => _user = user),
        ),
      authenticatedBuilder: widget.authenticatedBuilder,
    );
  }
}