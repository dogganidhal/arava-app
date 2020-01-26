import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/widgets/app/app_configuration_provider.dart';
import 'package:arava/widgets/main/main.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  final AppConfiguration configuration;

  const App({Key key, this.configuration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppConfigurationProvider(
      configuration: configuration,
      child: Main(),
    );
  }
}