import 'package:arava/blocs/navigation/event/navigation_event.dart';
import 'package:arava/blocs/navigation/state/navigation_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final GlobalKey<NavigatorState> navigatorState;

  NavigationBloc({@required this.navigatorState});

  @override
  NavigationState get initialState => NavigationState.navigator(
    route: "/home",
    homeIndex: 0
  );

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) => event.when(
    pop: _pop,
    navigateToHome: _navigateToHome,
    push: _push
  );

  void pop() {
    add(NavigationEvent.pop());
  }

  void navigateToHome([int index]) {
    add(NavigationEvent.navigateToHome(index: index));
  }

  void push(String route) {
    add(NavigationEvent.push(route: route));
  }

  Stream<NavigationState> _pop(Pop event) async* {
    navigatorState.currentState.pop();
  }

  Stream<NavigationState> _navigateToHome(NavigateToHome event) async* {
    yield NavigationState.navigator(
      route: "/home/${event.index}",
      homeIndex: event.index
    );
  }

  Stream<NavigationState> _push(Push event) async* {
    navigatorState.currentState.pushNamed(event.route);
  }
}