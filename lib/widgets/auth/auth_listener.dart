import 'package:arava/model/user/user.dart';
import 'package:arava/service/session.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

typedef Widget AuthenticatedWidgetBuilder(BuildContext context, User user);

class AuthListener extends StatelessWidget {
  final WidgetBuilder anonymousBuilder;
  final AuthenticatedWidgetBuilder authenticatedBuilder;
  final WidgetBuilder loaderBuilder;

  const AuthListener({
    Key key, this.anonymousBuilder,
    this.authenticatedBuilder,
    this.loaderBuilder
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User>(
      future: Modular.get<Session>().getUser(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return snapshot.data != null ?
              authenticatedBuilder(context, snapshot.data) :
              anonymousBuilder(context);
          default:
            return loaderBuilder(context);
        }
      },
    );
  }
}