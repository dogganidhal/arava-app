import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:arava/widgets/poi/poi_photo_carousel.dart';
import 'package:cache_image/cache_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/rendering.dart';


class PoiDetails extends StatefulWidget {
  final Poi poi;

  const PoiDetails({Key key, @required this.poi}) : super(key: key);

  @override
  _PoiDetailsState createState() => _PoiDetailsState();
}

class _PoiDetailsState extends State<PoiDetails> with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, initialIndex: 0, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, value) => [
          SliverAppBar(
            iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
            elevation: 0,
            expandedHeight: 200,
            stretch: true,
            floating: false,
            pinned: true,
            backgroundColor: Theme.of(context).backgroundColor,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {},
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
          )
        ],
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            _details,
            _comments
          ]
        ),
      ),
    );
  }

  Widget get _details => Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Wrap(
      runSpacing: 8,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 16),
          child: Row(
            children: <Widget>[
              ImageIcon(CacheImage(widget.poi.theme.icon.url)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.poi.title,
                  style: Theme.of(context)
                    .textTheme
                    .subhead,
                ),
              )
            ],
          ),
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
          )
      ],
    ),
  );

  Widget get _comments => Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      if (widget.poi.comments == null || widget.poi.comments.isEmpty)
        Padding(
          padding: EdgeInsets.all(16),
          child: Text(AppLocalizations.of(context).searchResult_NoCommentsPlaceholder()),
        )
    ],
  );
}