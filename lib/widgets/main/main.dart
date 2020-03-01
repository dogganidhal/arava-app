import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/navigation/state/navigation_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/widgets/favorites/favorites.dart';
import 'package:arava/widgets/favorites/favorites_app_bar.dart';
import 'package:arava/widgets/featured/featured.dart';
import 'package:arava/widgets/featured/featured_app_bar.dart';
import 'package:arava/widgets/map/map.dart';
import 'package:arava/widgets/map/map_app_bar.dart';
import 'package:arava/widgets/more/more.dart';
import 'package:arava/widgets/more/more_app_bar.dart';
import 'package:arava/widgets/photos/photos.dart';
import 'package:arava/widgets/photos/photos_app_bar.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Main extends StatelessWidget {
  final AppConfiguration configuration;

  final PageStorageBucket _bucket = PageStorageBucket();
  final List<Widget> _widgets = [
    Map(key: PageStorageKey('mapWidget')),
    Featured(key: PageStorageKey('featuredWidget')),
    Favorites(key: PageStorageKey('favoritesWidget')),
    Photos(key: PageStorageKey('photosWidget')),
    More(key: PageStorageKey('moreWidget'))
  ];
  final List<PreferredSizeWidget> _appBars = [
    MapAppBar(),
    FeaturedAppBar(),
    FavoritesAppBar(),
    PhotosAppBar(),
    MoreAppBar()
  ];

  Main({Key key, this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBloc, NavigationState>(
      bloc: Modular.get<NavigationBloc>(),
      builder: (context, state) => state.when<Widget>(
        navigator: (state) => Scaffold(
          appBar: _appBars[state.homeIndex],
          body: PageStorage(
            bucket: _bucket,
            child: _widgets[state.homeIndex]
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
      icon: Icon(Icons.photo_camera),
      title: Text(AppLocalizations.of(context).home_Photos())
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
      title: Text(AppLocalizations.of(context).home_More())
    )
  ];
}
