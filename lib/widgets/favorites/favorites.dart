import 'package:arava/blocs/favorites/favorites_bloc.dart';
import 'package:arava/blocs/favorites/state/favorites_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/widgets/poi/poi_details.dart';
import 'package:arava/widgets/poi/poi_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class Favorites extends StatefulWidget {
  Favorites({Key key}) : super(key: key);

  @override
  _FavoritesState createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final FavoritesBloc _favoritesBloc = Modular.get<FavoritesBloc>();

  @override
  void initState() {
    super.initState();
    _favoritesBloc.loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesBloc, FavoritesState>(
      bloc: Modular.get<FavoritesBloc>(),
      builder: (context, state) => state.whenOrElse(
        orElse: (_) => Center(
          child: CircularProgressIndicator(),
        ),
        favoritesReadyState: (readyState) => readyState.favorites.isEmpty ?
          Center(
            child: Text(
              AppLocalizations.of(context).favorites_EmptyFavorites(),
              style: Theme.of(context)
                .textTheme
                .subhead,
            ),
          ) :
          ListView.separated(
            itemCount: readyState.favorites.length,
            padding: EdgeInsets.all(8),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Modular.get<NavigationBloc>().pushRoute(MaterialPageRoute(
                builder: (BuildContext context) => PoiDetails(poi: readyState.favorites[index])
              )),
              child: PoiPreview(
                poi: readyState.favorites[index],
              ),
            ),
            separatorBuilder: (context, index) => SizedBox(height: 0),
          ),
      )
    );
  }
}