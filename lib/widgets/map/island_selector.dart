import 'package:arava/blocs/navigation/navigation_bloc.dart';
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

class IslandSelector extends ModularStatelessWidget<AppModule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).search_SelectIsland()),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          final islands = AppConfigurationProvider.of(context).islands;
          return Padding(
            padding: EdgeInsets.all(4),
            child: StaggeredGridView.countBuilder(
              addAutomaticKeepAlives: true,
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: islands.length,
              itemBuilder: (BuildContext context, int index) => IslandCard(
                island: islands[index],
                onSelected: () {
                  get<SearchBloc>()
                    .selectIsland(SearchEvent.selectIsland(
                      island: islands[index]
                    ));
                  get<NavigationBloc>().pop();
                },
              ),
              staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          );
        },
      ),
    );
  }
}