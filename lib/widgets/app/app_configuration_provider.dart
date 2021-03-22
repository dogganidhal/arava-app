import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:flutter/material.dart';

class AppConfigurationProvider extends InheritedWidget {
  final Widget child;
  final AppConfiguration configuration;

  AppConfigurationProvider({
    Key key,
    @required this.child,
    @required this.configuration
  }) : super(key: key, child: child);

  static AppConfiguration of(BuildContext context) {
    try {
      AppConfigurationProvider provider = context
        .findAncestorWidgetOfExactType<AppConfigurationProvider>();
      return provider.configuration;
    } on dynamic catch (_) {
      throw FlutterError(
        """
        AppConfiguration.of() called with a context that does not contain an AppConfiguration.
        No ancestor could be found starting from the context that was passed to AppConfiguration.of().

        The context used was: $context
        """,
      );
    }
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
