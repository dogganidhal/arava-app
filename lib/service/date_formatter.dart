import 'package:arava/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

abstract class DateFormatter {

  static final DateFormat _kDateFormat = DateFormat('dd/MM/yy');

  static String formatCommentDate(BuildContext context, DateTime date) {
    Duration durationSinceComment = DateTime.now().difference(date);
    if (durationSinceComment.inHours < 24) {
      return AppLocalizations.of(context)
        .searchResult_CommentBefore24Hours(durationSinceComment.inHours);
    }
    return _kDateFormat.format(date);
  }

}