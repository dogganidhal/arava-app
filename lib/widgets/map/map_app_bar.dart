import 'package:flutter/material.dart';


class MapAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        children: <Widget>[
          Text(
            "Arava",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary
            ),
          ),
          Image.asset(
            "assets/images/octopus.png",
            height: 24,
          )
        ],
      ),
      centerTitle: true
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}