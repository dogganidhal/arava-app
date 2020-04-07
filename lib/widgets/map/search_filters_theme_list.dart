import 'package:arava/model/poi_type/poi_type.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';


class SearchFiltersThemeList extends StatefulWidget {
  final List<PoiTheme> themes;
  final List<String> selectedThemes;
  final double leftPadding;
  final int alpha;

  const SearchFiltersThemeList({
    Key key,
    @required this.themes, @required this.selectedThemes,
    this.leftPadding = 0, this.alpha = 255
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SearchFiltersThemeListState();
}


class SearchFiltersThemeListState extends State<SearchFiltersThemeList> {
  GlobalKey<FormBuilderState> _formKey = GlobalKey();
  Map<String, ExpandableController> _controllerMap = {};
  List<String> _value;

  @override
  void initState() {
    super.initState();
    _value = List.from(widget.selectedThemes);
    void createControllerList(List<PoiTheme> themes) {
      themes.forEach((theme) {
        if (theme.subThemes.isNotEmpty) {
          _controllerMap[theme.id] = ExpandableController(initialExpanded: false);
          createControllerList(theme.subThemes);
        }
      });
    }
    createControllerList(widget.themes);
  }

  List<String> get value => List.unmodifiable(_value);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: _recursiveThemeList(
        themes: widget.themes,
        selectedThemes: widget.selectedThemes,
        alpha: widget.alpha,
        leftPadding: widget.leftPadding
      ),
    );
  }

  Widget _recursiveThemeList({
    List<PoiTheme> themes, List<String> selectedThemes,
    int alpha, double leftPadding
  }) => ListView.separated(
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: themes.length,
    separatorBuilder: (context, _) => Divider(height: 1),
    itemBuilder: (context, index) {
      final theme = themes[index];
      if (theme.subThemes.isNotEmpty) {
        return ExpandablePanel(
          controller: _controllerMap[theme.id],
          collapsed: _expansionButton(theme: theme, alpha: alpha, leftPadding: leftPadding),
          expanded: Column(
            children: <Widget>[
              _expansionButton(theme: theme, alpha: alpha, leftPadding: leftPadding),
              _recursiveThemeList(
                themes: theme.subThemes,
                selectedThemes: selectedThemes,
                leftPadding: leftPadding + 16,
                alpha: (alpha * 0.75).toInt(),
              )
            ],
          ),
        );
      }
      return _checkboxField(theme: theme, alpha: alpha, leftPadding: leftPadding);
    }
  );

  Widget _header({
    PoiTheme theme,
    double leftPadding,
    int alpha
  }) => Row(
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(left: 16 + leftPadding, right: 16),
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
  );

  Widget _expansionButton({
    PoiTheme theme,
    double leftPadding,
    int alpha
  }) {
    final controller = _controllerMap[theme.id];
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: <Widget>[
          _header(theme: theme, alpha: alpha, leftPadding: leftPadding),
          Expanded(
            child: Container()
          ),
          IconButton(
            icon: Icon(
              controller.expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
              color: Theme.of(context).textTheme.body1.color
            ),
            onPressed: () => setState(() => controller.expanded = !controller.expanded),
          ),
        ],
      ),
    );
  }

  Widget _checkboxField({
    PoiTheme theme,
    double leftPadding,
    int alpha
  }) => Padding(
    padding: EdgeInsets.symmetric(vertical: 8),
    child: FormBuilderCheckbox(
      attribute: theme.id,
      decoration: InputDecoration.collapsed(hintText: null),
      materialTapTargetSize: MaterialTapTargetSize.padded,
      initialValue: widget.selectedThemes.contains(theme.id),
      label: _header(theme: theme, alpha: alpha, leftPadding: leftPadding),
      onChanged: (checked) {
        if (checked && !_value.contains(theme.id)) {
          _value.add(theme.id);
        } else if (_value.contains(theme.id)) {
          _value.remove(theme.id);
        }
      },
    ),
  );
}