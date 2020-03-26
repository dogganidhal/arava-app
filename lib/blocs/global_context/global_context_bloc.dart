import 'package:arava/blocs/global_context/event/global_context_event.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/model/app_configuration/app_configuration.dart';
import 'package:arava/model/island/island.dart';
import 'package:bloc/bloc.dart';


class GlobalContextBloc extends Bloc<GlobalContextEvent, GlobalContextState> {
  @override
  GlobalContextState get initialState => GlobalContextState();

  @override
  Stream<GlobalContextState> mapEventToState(GlobalContextEvent event) => event.when(
    globalContextSetConfigurationEvent: _setConfiguration,
    globalContextSelectIslandEvent: _selectIsland
  );

  void updateSelectedIsland(Island island) {
    add(GlobalContextEvent.globalContextSelectIslandEvent(
      island: island
    ));
  }

  void updateConfiguration(AppConfiguration configuration) {
    add(GlobalContextEvent.globalContextSetConfigurationEvent(
      configuration: configuration
    ));
  }

  Stream<GlobalContextState> _selectIsland(GlobalContextSelectIslandEvent event) async* {
    yield state.withSelectedIsland(event.island);
  }

  Stream<GlobalContextState> _setConfiguration(GlobalContextSetConfigurationEvent event) async* {
    yield state.withConfiguration(event.configuration);
  }
}