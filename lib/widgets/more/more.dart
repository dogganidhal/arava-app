import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/widgets/auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class More extends StatelessWidget {

  More({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      bloc: Modular.get<AuthBloc>(),
      builder: (context, state) => Column(
        children: <Widget>[
          state.whenOrElse(
            orElse: (_) => Container(),
            authAuthenticatedState: (authenticatedState) => ListTile(
              leading: Icon(Icons.person, color: Theme.of(context).primaryColor),
              title: Text(
                AppLocalizations.of(context).more_Profile(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor)
              ),
              onTap: () => Modular.get<NavigationBloc>().push("/profile"),
            )
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Theme.of(context).primaryColor),
            title: Text(
              AppLocalizations.of(context).more_Settings(),
              style: TextStyle(
                color: Theme.of(context).primaryColor)
            ),
            onTap: () => Modular.get<NavigationBloc>().push("/settings"),
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
              Modular.get<NavigationBloc>().navigateToHome(2);
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
          state.whenOrElse(
            authAuthenticatedState: (_) => ListTile(
              leading: Icon(Icons.block, color: Theme.of(context).primaryColor),
              title: Text(
                AppLocalizations.of(context).more_Logout(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor)
              ),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(AppLocalizations.of(context).more_Logout()),
                    content: Text(AppLocalizations.of(context).more_LogoutConfirmation()),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)
                    ),
                    actions: <Widget>[
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        ),
                        textColor: Theme.of(context).errorColor,
                        child: Text(AppLocalizations.of(context).more_Logout()),
                        onPressed: () {
                          Modular.get<AuthBloc>().logout();
                          Modular.get<NavigationBloc>().pop();
                        },
                      ),
                      FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)
                        ),
                        textColor: Theme.of(context).primaryColor,
                        child: Text(AppLocalizations.of(context).general_Cancel()),
                        onPressed: () => Modular.get<NavigationBloc>().pop(),
                      )
                    ],
                  )
                );
              },
            ),
            orElse: (anonymousState) => ListTile(
              leading: Icon(Icons.lock, color: Theme.of(context).primaryColor),
              title: Text(
                AppLocalizations.of(context).more_LoginSignUp(),
                style: TextStyle(
                  color: Theme.of(context).primaryColor)
              ),
              onTap: () {
                final navigationBloc = Modular.get<NavigationBloc>();
                navigationBloc.pushRoute(MaterialPageRoute(
                  builder: (context) => Auth(
                    onAuthenticationSuccessful: (user) => navigationBloc.pop(),
                  )
                ));
              },
            )
          )
        ],
      ),
    );
  }

}