import 'package:arava/model/poi/poi.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:cache_image/cache_image.dart';
import 'package:flutter/material.dart';


class PoiPreview extends StatelessWidget {
  final Poi poi;

  const PoiPreview({Key key, this.poi}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: <Widget>[
            Image(
              fit: BoxFit.fitWidth,
              height: 192, width: double.infinity,
              image: poi.mainImage != null ?
                CacheImage(poi.mainImage.url) :
                AssetImage(AravaAssets.PoiPlaceholder),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Wrap(
                runSpacing: 8,
                spacing: 0,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image(
                        height: 24, width: 24,
                        fit: BoxFit.contain,
                        color: Theme.of(context).textTheme.title.color,
                        image: CacheImage(poi.theme.icon.url),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(poi.title),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Image(
                        height: 24, width: 24,
                        fit: BoxFit.contain,
                        color: Theme.of(context).textTheme.title.color,
                        image: AssetImage(AravaAssets.IslandIcon),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(poi.island),
                      ),
                    ],
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
  
}