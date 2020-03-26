import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/model/island/island.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class GlobalContextState implements Equatable {
  final Island selectedIsland;
  final AppConfiguration configuration;

  GlobalContextState({
    this.selectedIsland, this.configuration
  });

  @override
  List<Object> get props => [selectedIsland, configuration];

  @override
  bool get stringify => false;

  GlobalContextState withSelectedIsland(Island selectedIsland) => GlobalContextState(
    selectedIsland: selectedIsland,
    configuration: configuration
  );

  GlobalContextState withConfiguration(AppConfiguration configuration) => GlobalContextState(
    selectedIsland: selectedIsland,
    configuration: configuration
  );
}