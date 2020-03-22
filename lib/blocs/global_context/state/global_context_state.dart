import 'package:arava/model/island/island.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
class GlobalContextState implements Equatable {
  final Island selectedIsland;

  GlobalContextState({this.selectedIsland});

  @override
  List<Object> get props => [selectedIsland];

  @override
  bool get stringify => false;

  GlobalContextState withSelectedIsland(Island selectedIsland) => GlobalContextState(
    selectedIsland: selectedIsland
  );
}