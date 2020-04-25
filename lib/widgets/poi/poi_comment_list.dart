import 'package:arava/blocs/auth/auth_bloc.dart';
import 'package:arava/blocs/auth/state/auth_state.dart';
import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/comment/comment.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/widgets/auth/auth_required.dart';
import 'package:arava/widgets/poi/poi_comment.dart';
import 'package:arava/widgets/poi/poi_rate_comment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';


class PoiCommentList extends StatefulWidget {
  final Poi poi;

  PoiCommentList({Key key, this.poi}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PoiCommentListState();
}

class _PoiCommentListState extends State<PoiCommentList> with AutomaticKeepAliveClientMixin {
  List<Comment> _comments;

  @override
  void initState() {
    super.initState();
    _comments = widget.poi.comments;
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
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
}