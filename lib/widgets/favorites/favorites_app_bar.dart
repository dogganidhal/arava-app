import 'package:arava/i18n/app_localizations.dart';
import 'package:flutter/material.dart';


class FavoritesAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(AppLocalizations.of(context).home_Favorites()),
      centerTitle: true
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}