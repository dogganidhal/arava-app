import 'package:arava_app/i18n/app_localizations.dart';
import 'package:arava_app/widgets/favorites/favorites.dart';
import 'package:arava_app/widgets/favorites/favorites_app_bar.dart';
import 'package:arava_app/widgets/featured/featured.dart';
import 'package:arava_app/widgets/featured/featured_app_bar.dart';
import 'package:arava_app/widgets/map/map.dart';
import 'package:arava_app/widgets/map/map_app_bar.dart';
import 'package:arava_app/widgets/more/more.dart';
import 'package:arava_app/widgets/more/more_app_bar.dart';
import 'package:arava_app/widgets/photos/photos.dart';
import 'package:arava_app/widgets/photos/photos_app_bar.dart';
import 'package:flutter/material.dart';


class Main extends StatefulWidget {
  final int selectedTab;

  Main({Key key, this.title, this.selectedTab}) : super(key: key);

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedTab;

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

  @override
  void initState() {
    super.initState();
    _selectedTab = widget.selectedTab ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBars[_selectedTab],
      body: PageStorage(
        bucket: _bucket,
        child: _widgets[_selectedTab]
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) => setState(() => _selectedTab = index),
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.primary.withOpacity(0.25),
        items: _bottomNavigationBarItems(context),
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