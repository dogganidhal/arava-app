import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class MapAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalContextBloc, GlobalContextState>(
      bloc: Modular.get<GlobalContextBloc>(),
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
                  state.selectedIsland.name,
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