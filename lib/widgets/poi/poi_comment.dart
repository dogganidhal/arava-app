import 'package:arava/model/comment/comment.dart';
import 'package:arava/service/date_formatter.dart';
import 'package:flutter/material.dart';


class PoiComment extends StatelessWidget {
  final Comment comment;

  const PoiComment({Key key, @required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(width: 0.5, color: Theme.of(context).cardColor)
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 0.5
                    ),
                    borderRadius: BorderRadius.circular(24)
                  ),
                  child: Center(
                    child: Text(
                      "${comment.author.fullName.split(" ").elementAt(0).substring(0, 1)}"
                        "${comment.author.fullName.split(" ").elementAt(1).substring(0, 1)}",
                      style: Theme
                        .of(context)
                        .textTheme
                        .subhead
                        .copyWith(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
                Expanded(child: Container()),
                Text("${DateFormatter.formatCommentDate(context,  comment.date)}"),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                comment.author.fullName,
                style: Theme.of(context)
                  .textTheme
                  .caption,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(comment.content),
            )
          ],
        ),
      ),
    );
  }
}