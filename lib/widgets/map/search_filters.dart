import 'package:arava/blocs/navigation/navigation_bloc.dart';
import 'package:arava/blocs/search/search_bloc.dart';
import 'package:arava/blocs/search/state/search_state.dart';
import 'package:arava/i18n/app_localizations.dart';
import 'package:arava/model/search_filters/search_filters.dart' as model show SearchFilters;
import 'package:arava/widgets/app/app_configuration_provider.dart';
import 'package:arava/widgets/map/search_filters_theme_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';


class SearchFilters extends StatelessWidget {
  static final String _kQueryFieldAttribute = "query";
  static final String _kFeaturedAttribute = "featured";

  final GlobalKey<FormBuilderState> _formKey = GlobalKey();
  final GlobalKey<SearchFiltersThemeListState> _themeListFormKey = GlobalKey();

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
                  attribute: _kFeaturedAttribute,
                  initialValue: state.request.featured ?? false,
                  decoration: InputDecoration.collapsed(hintText: null),
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
                SearchFiltersThemeList(
                  key: _themeListFormKey,
                  themes: AppConfigurationProvider.of(context).themes
                    .where((theme) => theme.parent == null)
                    .toList(),
                  selectedThemes: state.request.themeIds,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  model.SearchFilters _buildFilters() {
    _formKey.currentState.saveAndValidate();

    final values = _formKey.currentState.value;
    final query = values[_kQueryFieldAttribute];
    final featured = values[_kFeaturedAttribute];
    final themeIds = _themeListFormKey.currentState.value;

    return model.SearchFilters(
      query: query,
      featured: featured,
      themeIds: themeIds
    );
  }
}