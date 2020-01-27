import 'package:arava/blocs/search/event/search_event.dart';
import 'package:arava/blocs/search/state/search_state.dart';
import 'package:bloc/bloc.dart';


class SearchBloc extends Bloc<SearchEvent, SearchState> {
  @override
  SearchState get initialState => SearchState.search(
    result: null,
    selectedIsland: null
  );

  @override
  Stream<SearchState> mapEventToState(SearchEvent event) => event.when(
    searchForPois: _searchForPois
  );

  Stream<SearchState> _searchForPois(SearchForPois event) async* {

  }
}