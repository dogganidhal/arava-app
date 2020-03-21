import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/blocs/favorites/favorites_bloc.dart';
import 'package:arava/blocs/favorites/state/favorites_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/comment/comment.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:arava/widgets/auth/auth_required.dart';
import 'package:arava/widgets/poi/poi_comment.dart';
import 'package:arava/widgets/poi/poi_photo_carousel.dart';
import 'package:arava/widgets/poi/poi_rate_comment.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:cache_image/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class PoiDetails extends StatefulWidget {
  final Poi poi;

  const PoiDetails({Key key, @required this.poi}) : super(key: key);

  @override
  _PoiDetailsState createState() => _PoiDetailsState();
}

class _PoiDetailsState extends State<PoiDetails> with SingleTickerProviderStateMixin {
  TabController _tabController;
  List<Comment> _comments;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
    _comments = widget.poi.comments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) => [
          SliverOverlapAbsorber(
            handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            child: SliverAppBar(
              iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
              elevation: 0,
              expandedHeight: 200,
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
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
                    ),
                    SliverFillRemaining(
                      child: _detailsSection,
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
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(bottom: 8),
                      sliver: SliverFillRemaining(
                        hasScrollBody: false,
                        child: _commentsSection,
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

  Widget get _detailsSection => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Wrap(
      runSpacing: 8,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Row(
            children: <Widget>[
              Text(
                widget.poi.title,
                style: Theme.of(context)
                  .textTheme
                  .subhead,
              ),
              Expanded(child: Container()),
              RatingBar(
                initialRating: widget.poi.ratings.averageScore,
                ignoreGestures: true,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 24,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Theme.of(context).primaryColor),
                  half: Icon(Icons.star_half, color: Theme.of(context).primaryColor),
                  empty: Icon(Icons.star_border, color: Theme.of(context).primaryColor)
                ),
                onRatingUpdate: (r) => debugPrint("New Rating : $r"),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "${widget.poi.ratings.count}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: <Widget>[
            ImageIcon(
              CacheImage(widget.poi.theme.icon.url),
              color: Theme.of(context).unselectedWidgetColor,
              size: 18,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                widget.poi.theme.name,
                style: Theme.of(context)
                  .textTheme
                  .caption,
              ),
            )
          ],
        ),
        Text(
          widget.poi.description ?? AppLocalizations.of(context).searchResult_NoDescriptionPlaceholder(),
        ),
        if (widget.poi.details?.address != null)
          Row(
            children: <Widget>[
              Icon(Icons.location_on),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.poi.details.address),
              )
            ],
          ),
        if (widget.poi.details?.email != null)
          Row(
            children: <Widget>[
              Icon(Icons.email),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.poi.details.email),
              )
            ],
          ),
        if (widget.poi.details?.phone != null)
          Row(
            children: <Widget>[
              Icon(Icons.smartphone),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.poi.details.phone),
              )
            ],
          ),
        if (widget.poi.details?.website != null)
          Row(
            children: <Widget>[
              Icon(Icons.language),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.poi.details.website),
              )
            ],
          ),
        if (widget.poi.details?.address != null)
          Row(
            children: <Widget>[
              ImageIcon(
                AssetImage(AravaAssets.FacebookLogo),
                size: 22,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.poi.details.address),
              )
            ],
          ),
        if (widget.poi.details?.instagramAccount != null)
          Row(
            children: <Widget>[
              ImageIcon(
                AssetImage(AravaAssets.InstagramLogo),
                size: 22,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text("@${widget.poi.details.instagramAccount}"),
              )
            ],
          ),
        if (widget.poi.details?.openingHours != null)
          Row(
            children: <Widget>[
              Icon(Icons.watch_later),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(widget.poi.details.openingHours),
              )
            ],
          )
      ],
    ),
  );

  Widget get _commentsSection => Padding(
    padding: EdgeInsets.all(0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        BlocBuilder<AuthBloc, AuthState>(
          bloc: Modular.get<AuthBloc>(),
          builder: (context, state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ButtonTheme(
              height: 48,
              child: FlatButton.icon(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4)
                ),
                textColor: Theme.of(context).primaryColor,
                onPressed: () async {
                  final Comment comment = await Modular.get<NavigationBloc>().pushRoute(MaterialPageRoute(
                    builder: (context) => AuthRequired(
                      anonymousDescription: AppLocalizations.of(context).searchResult_SignUpToComment(),
                      authenticatedBuilder: (context, _) => PoiRateComment(
                        poi: widget.poi,
                      ),
                    )
                  ));
                  if (comment != null) {
                    setState(() {
                      _comments = [..._comments, comment];
                    });
                  }
                },
                label: Text(AppLocalizations.of(context).searchResult_RateComment()),
                icon: Icon(Icons.edit),
              ),
            ),
          ),
        ),
        if (_comments == null || _comments.isEmpty)
          Text(AppLocalizations.of(context).searchResult_NoCommentsPlaceholder())
        else
          Column(
            children: _comments
              .map((comment) => PoiComment(
                comment: comment
              ))
              .toList(),
          ),
      ],
    ),
  );
}