import 'package:arava/blocs/global_context/event/global_context_event.dart';
import 'package:arava/blocs/global_context/state/global_context_state.dart';
import 'package:arava/model/island/island.dart';
import 'package:bloc/bloc.dart';


class GlobalContextBloc extends Bloc<GlobalContextEvent, GlobalContextState> {
  @override
  GlobalContextState get initialState => GlobalContextState();

  @override
  Stream<GlobalContextState> mapEventToState(GlobalContextEvent event) => event.when(
    globalContextEditEvent: _edit
  );

  void updateSelectedIsland(Island island) {
    add(GlobalContextEvent.globalContextEditEvent(
      context: state.withSelectedIsland(island)
    ));
  }

  Stream<GlobalContextState> _edit(GlobalContextEditEvent event) async* {
    yield event.context;
  }
}