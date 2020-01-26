import 'package:arava_app/blocs/navigation/navigation_bloc.dart';
import 'package:arava_app/i18n/app_localizations.dart';
import 'package:arava_app/modules/app_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class More extends ModularStatelessWidget<AppModule> {

  More({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
          title: Text(
            AppLocalizations.of(context).more_Settings(),
            style: TextStyle(
              color: Theme.of(context).primaryColor)
          ),
          onTap: () => get<NavigationBloc>().push("/settings"),
        ),
        Divider(height: 1),
        ListTile(
          leading: Icon(Icons.favorite, color: Theme.of(context).primaryColor),
          title: Text(
            AppLocalizations.of(context).more_Favorites(),
            style: TextStyle(
              color: Theme.of(context).primaryColor)
          ),
          onTap: () {
            get<NavigationBloc>().navigateToHome(2);
          },
        ),
        Divider(height: 1),
        ListTile(
          leading: Icon(Icons.question_answer, color: Theme.of(context).primaryColor),
          title: Text(
            AppLocalizations.of(context).more_QaA(),
            style: TextStyle(
              color: Theme.of(context).primaryColor)
          ),
          onTap: () {
            debugPrint("Q&A");
          },
        ),
        Divider(height: 1),
        ListTile(
          leading: Icon(Icons.email, color: Theme.of(context).primaryColor),
          title: Text(
            AppLocalizations.of(context).more_EmailUs(),
            style: TextStyle(
              color: Theme.of(context).primaryColor)
          ),
          onTap: () {
            debugPrint("Email us");
          },
        ),
        Divider(height: 1),
        ListTile(
          leading: Icon(Icons.lock, color: Theme.of(context).primaryColor),
          title: Text(
            AppLocalizations.of(context).more_LoginSignUp(),
            style: TextStyle(
              color: Theme.of(context).primaryColor)
          ),
          onTap: () {
            debugPrint("Login / signup");
          },
        )
      ],
    );
  }

}