import 'package:arava/blocs/comment/comment_bloc.dart';
import 'package:arava/blocs/comment/state/comment_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/poi/poi.dart';
import 'package:arava/model/rate_comment_request/rate_comment_request.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class PoiRateComment extends StatefulWidget {
  final Poi poi;

  const PoiRateComment({Key key, @required this.poi}) : super(key: key);

  @override
  _PoiRateCommentState createState() => _PoiRateCommentState();
}

class _PoiRateCommentState extends State<PoiRateComment> {
  static final String _kCommentAttribute = "comment";

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  CommentBloc _commentBloc;
  double _rating;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _commentBloc = Modular.get<CommentBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      bloc: _commentBloc,
      builder: (context, state) => Scaffold(
        appBar: AppBar(
          title: RatingBar(
            initialRating: 0,
            itemCount: 5,
            itemSize: 24,
            minRating: 1,
            allowHalfRating: true,
            ratingWidget: RatingWidget(
              full: Icon(Icons.star, color: Theme.of(context).primaryColor),
              half: Icon(Icons.star_half, color: Theme.of(context).primaryColor),
              empty: Icon(Icons.star_border, color: Theme.of(context).primaryColor)
            ),
            onRatingUpdate: (rating) {
              setState(() {
                _rating = rating;
              });
            },
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.check),
              onPressed: state.whenOrElse(
                commentLoadingState: (loadingState) => null,
                orElse: (_) => _submit
              )
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: FormBuilder(
              key: _formKey,
              autovalidate: false,
              child: FormBuilderTextField(
                attribute: _kCommentAttribute,
                maxLines: 10,
                decoration: InputDecoration.collapsed(
                  hintText: 'Write something'
                ),
                validators: [
                  (value) {
                    if (_rating == null && value == null) {
                      return AppLocalizations.of(context).general_RequiredField();
                    }
                    return null;
                  }
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (!_formKey.currentState.saveAndValidate()) {
      return;
    }
    final values = _formKey.currentState.value;
    final String comment = values[_kCommentAttribute];
    final double rating = _rating;

    _commentBloc.submitComment(
      poi: widget.poi,
      request: RateCommentRequest(
        comment: comment,
        rating: rating
      )
    );
  }
}