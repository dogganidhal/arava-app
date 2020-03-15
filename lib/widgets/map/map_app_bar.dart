import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/blocs/search/state/search_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: Modular.get(),
      builder: (context, state) => AppBar(
        actions: <Widget>[
          FlatButton(
            onPressed: () => Modular.get<NavigationBloc>().push("/search/selectIslands"),
            splashColor: Theme.of(context).primaryColor.withAlpha(50),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4),
                  child: Image.asset(
                    AravaAssets.IslandIcon,
                    color: Theme.of(context).primaryColor,
                    height: 18,
                  ),
                ),
                Text(
                  state.island != null ?
                    state.island.name :
                    AppLocalizations.of(context).general_Island(),
                  style: TextStyle(
                    color: Theme.of(context).primaryColor)
                ),
              ],
            ),
          )
        ],
        title: Row(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Image.asset(
                AravaAssets.Logo,
                height: 24,
              ),
            ),
            Text(
              AppLocalizations.of(context).appName(),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary
              ),
            ),
          ],
        ),
        centerTitle: true
      )
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}