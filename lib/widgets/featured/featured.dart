import 'package:arava/blocs/featured/featured_bloc.dart';
import 'package:arava/blocs/featured/state/featured_state.dart';
import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:arava/widgets/poi/poi_details.dart';
import 'package:cache_image/cache_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

enum FeaturedPoiType {
  SPONSORED,
  ACTIVITY
}

class Featured extends StatefulWidget {
  final FeaturedPoiType type;

  Featured({Key key, @required this.type}) : super(key: key);

  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  final FeaturedBloc _featuredBloc = Modular.get<FeaturedBloc>();
  final GlobalContextBloc _globalContextBloc = Modular.get<GlobalContextBloc>();

  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case FeaturedPoiType.SPONSORED:
        _featuredBloc.loadFeatured(_globalContextBloc.state.selectedIsland);
        break;
      case FeaturedPoiType.ACTIVITY:
        _featuredBloc.loadActivities(_globalContextBloc.state.selectedIsland);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GlobalContextBloc, GlobalContextState>(
      bloc: _globalContextBloc,
      condition: (previous, current) => previous.selectedIsland.id != current.selectedIsland.id,
      listener: (context, state) => _featuredBloc.loadFeatured(state.selectedIsland),
      child: BlocBuilder<GlobalContextBloc, GlobalContextState>(
        bloc: _globalContextBloc,
        builder: (context, globalContext) {
          return BlocBuilder<FeaturedBloc, FeaturedState>(
            bloc: _featuredBloc,
            builder: (context, state) => state.when(
              featuredLoadingState: (loadingState) => Center(
                child: CircularProgressIndicator(),
              ),
              featuredFailingState: (failingState) => Center(
                child: Text(failingState.exception.getLocalizedMessage(context)),
              ),
              featuredReadyState: (readyState) {
                if (readyState.pois.isEmpty) {
                  return Center(
                    child: Text(AppLocalizations.of(context).general_NoItems()),
                  );
                }
                final groupedPois = _groupPois(readyState.pois);
                return CustomScrollView(
                  slivers: <Widget>[
                    ...groupedPois.keys
                      .map((themeId) {
                        final theme = globalContext.configuration.themes
                          .firstWhere((t) {
                            return t.id == themeId;
                          });
                        return SliverStickyHeader(
                          header: Container(
                            color: Theme.of(context).backgroundColor,
                            padding: EdgeInsets.all(16),
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 16,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: <Widget>[
                                ImageIcon(
                                  CacheImage(theme.icon.url),
                                  color: Theme.of(context).primaryColor,
                                ),
                                Text(
                                  theme.name.toUpperCase(),
                                  style: Theme.of(context)
                                    .textTheme
                                    .subhead
                                    .copyWith(color: Theme.of(context).primaryColor),
                                )
                              ],
                            ),
                          ),
                          sliver: SliverGrid.count(
                            crossAxisCount: 2,
                            children: groupedPois[themeId]
                              .map((poi) => GestureDetector(
                              onTap: () => Modular.get<NavigationBloc>().pushRoute(MaterialPageRoute(
                                builder: (BuildContext context) => PoiDetails(poi: poi)
                              )),
                              child: Card(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: Image(
                                  fit: BoxFit.cover,
                                  image: poi.mainImage != null ?
                                    CacheImage(poi.mainImage.url) :
                                    AssetImage(AravaAssets.PoiPlaceholder)
                                ),
                              ),
                            ))
                              .toList(),
                          ),
                        );
                      }
                    )
                  ],
                );
              }
            ),
          );
        },
      ),
    );
  }

  Map<String, List<Poi>> _groupPois(List<Poi> pois) => groupBy(pois, (Poi poi) => poi.theme.id);
}