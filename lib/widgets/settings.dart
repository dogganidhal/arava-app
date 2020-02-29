import 'package:arava/blocs/app/app_bloc.dart';
import 'package:arava/blocs/app/state/app_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/widgets/language_selector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).settings_Title()),
        centerTitle: true,
        brightness: Brightness.dark,
      ),
      body: BlocBuilder<AppBloc, AppState>(
        bloc: Modular.get<AppBloc>(),
        builder: (context, _) => Column(children: <Widget>[
          ListTile(
            leading: Icon(Icons.translate, color: Theme.of(context).primaryColor),
//            trailing: Text(AppLocalizations.currentLanguage),
          trailing: LanguageSelector(),
            title: Text(
              AppLocalizations.of(context).settings_Language(),
              style: TextStyle(color: Theme.of(context).primaryColor)
            ),
          ),
          Divider(height: 1),
        ]),
      ),
    );
  }
}
