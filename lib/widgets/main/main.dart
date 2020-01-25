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
  Main({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _selectedTab = 0;

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
        items: _bottomNavigationBarItems,
      ),
    );
  }

  List<BottomNavigationBarItem> get _bottomNavigationBarItems => [
    BottomNavigationBarItem(
      icon: Icon(Icons.map),
      title: Text("Carte")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.star),
      title: Text("À la une")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      title: Text("Favoris")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.photo_camera),
      title: Text("Photos")
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.more_horiz),
      title: Text("Plus")
    )
  ];
}