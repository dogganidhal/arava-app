import 'package:arava_app/model/app_configuration/app_configuration.dart';
import 'package:flutter/material.dart';

class AppConfigurationProvider extends InheritedWidget {
  final Widget child;
  final AppConfiguration configuration;

  AppConfigurationProvider({Key key, this.child, this.configuration}) : super(key: key, child: child);

  static AppConfiguration of(BuildContext context) {
    try {
      AppConfigurationProvider provider = context
        .inheritFromWidgetOfExactType(AppConfigurationProvider);
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