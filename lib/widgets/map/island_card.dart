import 'package:arava/model/island/island.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cache_image/cache_image.dart';

class IslandCard extends StatefulWidget {
  final Island island;
  final VoidCallback onSelected;

  const IslandCard({
    Key key, @required this.island, @required this.onSelected
  }) : super(key: key);

  @override
  _IslandCardState createState() => _IslandCardState();
}

class _IslandCardState extends State<IslandCard> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      onTap: () => widget.onSelected(),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Theme.of(context).dividerColor, width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Column(
          children: <Widget>[
            AspectRatio(
              aspectRatio: 4/3,
              child: Image(
                fit: BoxFit.cover,
                image: CacheImage(widget.island.image.url),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                widget.island.name,
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}