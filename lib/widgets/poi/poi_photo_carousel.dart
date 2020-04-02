import 'package:arava/model/poi/poi.dart';
import 'package:arava/theme/arava_assets.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


class PoiPhotoCarousel extends StatefulWidget {
  final Poi poi;

  const PoiPhotoCarousel({Key key, @required this.poi}) : super(key: key);

  @override
  _PoiPhotoCarouselState createState() => _PoiPhotoCarouselState();
}

class _PoiPhotoCarouselState extends State<PoiPhotoCarousel> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  int _current = 0;

  List<Widget> get images => (widget.poi.medias != null && widget.poi.medias.isNotEmpty) || widget.poi.mainImage != null ?
    [
      if (widget.poi.mainImage != null)
        widget.poi.mainImage,
      ...widget.poi.medias,
    ]
      .map((media) => media.url)
      .map((url) => Image(
        fit: BoxFit.cover,
        width: double.infinity,
        image: NetworkImage(url),
      ))
      .toList() :
    [
      Image(
        fit: BoxFit.cover,
        width: double.infinity,
        image: AssetImage(AravaAssets.PoiPlaceholder)
      )
    ];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Stack(
      children: <Widget>[
        CarouselSlider(
          enableInfiniteScroll: false,
          items: images,
          viewportFraction: 1.0,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index) => setState(() => _current = index),
        ),
        Positioned(
          bottom: 8, left: 0, right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(images.length, (i) => i)
              .map((index) => Container(
                width: 8, height: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context)
                    .dividerColor
                    .withOpacity(_current == index ? 0.9 : 0.4)
                ),
              ))
              .toList(),
          )
        )
      ],
    );
  }
}