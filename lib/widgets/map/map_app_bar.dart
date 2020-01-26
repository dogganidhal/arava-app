import 'package:flutter/material.dart';


class MapAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Image.asset(
            "assets/images/octopus.png",
            height: 24,
          ),
          Text(
            "Arava",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            ),
          ),
        ],
      ),
      centerTitle: true
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}