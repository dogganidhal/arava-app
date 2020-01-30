import 'package:arava/blocs/search/event/search_event.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/modules/app_module.dart';
import 'package:arava/widgets/app/app_configuration_provider.dart';
import 'package:arava/widgets/map/island_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class IslandSelector extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IslandSelectorState();
}


class _IslandSelectorState extends ModularState<IslandSelector, AppModule> {
  List<Widget> _archipelagoWidgets;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _archipelagoWidgets = AppConfigurationProvider.of(context)
      .archipelagos
      .map((archipelago) {
        final islandCards = archipelago.islands
          .map((island) => IslandCard(
            island: island,
            onSelected: () => get<SearchBloc>()
              .selectIsland(SearchEvent.selectIsland(
              island: island
            )),
          ))
          .toList();
        return Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                archipelago.name.toUpperCase(),
                style: Theme.of(context).textTheme.headline
                  .copyWith(
                    fontSize: 16
                  ),
              ),
            ),
            StaggeredGridView.countBuilder(
              physics: NeverScrollableScrollPhysics(),
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: islandCards.length,
              itemBuilder: (BuildContext context, int index) => islandCards[index],
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            )
          ],
        );
      })
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).search_SelectIsland()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(4),
          child: Column(
            children: _archipelagoWidgets,
          ),
        ),
      )
    );
  }
}