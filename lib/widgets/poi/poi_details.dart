import 'package:arava/blocs/global_context/global_context_bloc.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';


class PoiDetails extends StatefulWidget {
  final Poi poi;

  PoiDetails({Key key, this.poi}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PoiDetailsState();
}

class _PoiDetailsState extends State<PoiDetails> with AutomaticKeepAliveClientMixin {
  final GlobalContextBloc _globalContextBloc = Modular.get();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
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
                  onRatingUpdate: null,
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
            widget.poi.description ?? AppLocalizations.of(context)
              .searchResult_NoDescriptionPlaceholder(),
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
  }
}