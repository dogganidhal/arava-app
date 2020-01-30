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
  List<IslandCard> _islandCards;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _islandCards = AppConfigurationProvider.of(context)
      .islands
      .map((island) => IslandCard(
        island: island,
        onSelected: () => get<SearchBloc>()
          .selectIsland(SearchEvent.selectIsland(
          island: island
        )),
      ))
      .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).search_SelectIsland()),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(4),
        child: StaggeredGridView.countBuilder(
          addAutomaticKeepAlives: true,
          shrinkWrap: true,
          crossAxisCount: 2,
          itemCount: _islandCards.length,
          itemBuilder: (BuildContext context, int index) => _islandCards[index],
          staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
        ),
      ),
    );
  }
}