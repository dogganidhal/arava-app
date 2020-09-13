import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/navigation/state/navigation_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/widgets/favorites/favorites.dart';
import 'package:arava/widgets/favorites/favorites_app_bar.dart';
import 'package:arava/widgets/featured/featured.dart';
import 'package:arava/widgets/map/map.dart';
import 'package:arava/widgets/map/map_app_bar.dart';
import 'package:arava/widgets/more/more.dart';
import 'package:arava/widgets/more/more_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Main extends StatelessWidget {
  final AppConfiguration configuration;

  final List<PreferredSizeWidget> _appBars = [
    MapAppBar(),
    MapAppBar(),
    FavoritesAppBar(),
    MapAppBar(),
    MoreAppBar()
  ];

  Widget get _map => Map();
  Widget get _featured => Featured(type: FeaturedPoiType.SPONSORED);
  Widget get _favorites => Favorites();
  Widget get _activities => Featured(type: FeaturedPoiType.ACTIVITY);
  Widget get _more => More();

  Main({Key key, this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      bloc: Modular.get<NavigationBloc>(),
      builder: (context, state) => state.when<Widget>(
        navigatorState: (state) => Scaffold(
          appBar: _appBars[state.homeIndex],
          body: IndexedStack(
            index: state.homeIndex,
            children: <Widget>[
              _map,
              _featured,
              _favorites,
              _activities,
              _more
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: state.homeIndex,
            onTap: (index) => Modular.get<NavigationBloc>().navigateToHome(index),
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
            items: _bottomNavigationBarItems(context),
          ),
        )
      ),
    );
  }

  List<BottomNavigationBarItem> _bottomNavigationBarItems(BuildContext context) => [
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text(AppLocalizations.of(context).home_Map())
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      title: Text(AppLocalizations.of(context).home_Featured())
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text(AppLocalizations.of(context).home_Favorites())
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.rowing),
      title: Text(AppLocalizations.of(context).home_Activities())
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
      title: Text(AppLocalizations.of(context).home_More())
    )
  ];
}
