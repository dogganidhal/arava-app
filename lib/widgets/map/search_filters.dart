import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/blocs/search/state/search_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/poi_type/poi_type.dart';
import 'package:arava/model/search_filters/search_filters.dart' as model show SearchFilters;
import 'package:arava/widgets/app/app_configuration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SearchFilters extends StatelessWidget {
  static final String _kQueryFieldAttribute = "query";
  static final String _kSponsoredAttribute = "sponsored";

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      bloc: Modular.get(),
      builder: (context, state) => FormBuilder(
        key: _formKey,
        autovalidate: false,
        child: Scaffold(
          appBar: AppBar(
            title: FormBuilderTextField(
              maxLines: 1,
              attribute: _kQueryFieldAttribute,
              initialValue: state.request.title,
              decoration: InputDecoration.collapsed(
                hintText: AppLocalizations.of(context).search_FilterQueryPlaceholder()
              ),
              autofocus: true,
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  Modular.get<SearchBloc>().setSearchFilters(_buildFilters());
                  Modular.get<NavigationBloc>().pop();
                }
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                FormBuilderCheckbox(
                  attribute: _kSponsoredAttribute,
                  initialValue: state.request.sponsored ?? false,
                  label: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(Icons.star),
                      ),
                      Text(AppLocalizations.of(context).search_FilterSponsored())
                    ],
                  )
                ),
                ...(
                  _themeListColumn(
                    context,
                    AppConfigurationProvider.of(context)
                      .themes
                      .where((theme) => theme.parent == null)
                      .toList(),
                    state
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _themeListColumn(
    BuildContext context, List<PoiTheme> themes, SearchState state,
    [double padding = 0, int alpha = 255]
  ) => themes
    .map((theme) => Column(
      children: <Widget>[
        FormBuilderCheckbox(
          attribute: theme.id,
          initialValue: state.request.themeIds.contains(theme.id),
          label: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16 + padding, right: 16),
                child: ImageIcon(
                  NetworkImage(theme.icon.url),
                  color: Theme.of(context)
                    .textTheme
                    .body1
                    .color
                    .withAlpha(alpha),
                ),
              ),
              Text(
                theme.name,
                style: TextStyle(
                  color: Theme.of(context)
                    .textTheme
                    .body1
                    .color
                    .withAlpha(alpha)
                ),
              )
            ],
          )
        ),
        ..._themeListColumn(context, theme.subThemes ?? [], state, padding + 32, (alpha * 0.75).toInt())
      ],
    ))
    .toList();

  model.SearchFilters _buildFilters() {
    _formKey.currentState.saveAndValidate();

    final values = _formKey.currentState.value;
    final query = values[_kQueryFieldAttribute];
    final sponsored = values[_kSponsoredAttribute];
    final themeIds = values.keys
      .where((key) => key != _kSponsoredAttribute && key != _kQueryFieldAttribute)
      .where((key) => values[key] == true)
      .toList();

    return model.SearchFilters(
      query: query,
      sponsored: sponsored,
      themeIds: themeIds
    );
  }
}