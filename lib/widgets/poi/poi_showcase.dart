import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/blocs/favorites/favorites_bloc.dart';
import 'package:arava/blocs/favorites/state/favorites_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/comment/comment.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/widgets/auth/auth_required.dart';
import 'package:arava/widgets/poi/poi_comment.dart';
import 'package:arava/widgets/poi/poi_comment_list.dart';
import 'package:arava/widgets/poi/poi_details.dart';
import 'package:arava/widgets/poi/poi_photo_carousel.dart';
import 'package:arava/widgets/poi/poi_rate_comment.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class PoiShowcase extends StatefulWidget {
  final Poi poi;

  const PoiShowcase({Key key, @required this.poi}) : super(key: key);

  @override
  _PoiShowcaseState createState() => _PoiShowcaseState();
}

class _PoiShowcaseState extends State<PoiShowcase> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            elevation: 0,
            expandedHeight: 200,
            pinned: true,
            backgroundColor: Theme.of(context).backgroundColor,
            actions: <Widget>[
              IconButton(
                icon: BlocBuilder<FavoritesBloc, FavoritesState>(
                  bloc: Modular.get<FavoritesBloc>(),
                  builder: (context, state) => state.whenOrElse(
                    favoritesReadyState: (readyState) => Icon(
                      readyState.favoritesIds.contains(widget.poi.id) ?
                        Icons.favorite :
                        Icons.favorite_border
                    ),
                    orElse: (_) => Container()
                  ),
                ),
                onPressed: () => Modular.get<FavoritesBloc>().toggleFavorite(widget.poi),
              )
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) => FlexibleSpaceBar(
                title: AnimatedOpacity(
                  opacity: constraints.biggest.height > (80 + MediaQuery.of(context).padding.top) ? 0 : 1,
                  duration: Duration(milliseconds: 200),
                  child: Text(widget.poi.title, style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
                background: PoiPhotoCarousel(poi: widget.poi),
                centerTitle: true,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                unselectedLabelColor: Theme.of(context).unselectedWidgetColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: new BubbleTabIndicator(
                  indicatorHeight: 24,
                  indicatorColor: Theme.of(context).primaryColor,
                  tabBarIndicatorSize: TabBarIndicatorSize.label,
                ),
                tabs: <Widget>[
                  Tab(text: AppLocalizations.of(context).searchResult_DetailsTabTitle()),
                  Tab(text: AppLocalizations.of(context).searchResult_CommentsTabTitle())
                ],
              ),
            ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            SafeArea(
              top: false, bottom: false,
              child: Builder(
                builder: (context) => CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: PoiDetails(poi: widget.poi),
                    )
                  ],
                ),
              )
            ),
            SafeArea(
              top: false, bottom: false,
              child: Builder(
                builder: (context) => CustomScrollView(
                  slivers: <Widget>[
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 8),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: PoiCommentList(poi: widget.poi),
                      ),
                    )
                  ],
                ),
              )
            ),
          ]
        ),
      ),
    );
  }
}