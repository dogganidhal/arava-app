import 'package:arava/blocs/navigation/event/navigation_event.dart';
import 'package:arava/blocs/navigation/state/navigation_state.dart' show NavigationState;
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final GlobalKey<NavigatorState> navigatorState;

  NavigationBloc({@required this.navigatorState});

  @override
  NavigationState get initialState => NavigationState.navigatorState(
    route: "/home",
    homeIndex: 0
  );

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) => event.when(
    navigationPopEvent: _pop,
    navigationPopWithValueEvent: _popWithValue,
    navigateToHomeEvent: _navigateToHome,
    navigationPushEvent: _push
  );

  void pop([dynamic value]) {
    if (value != null) {
      add(NavigationEvent.navigationPopWithValueEvent(value: value));
    } else {
      add(NavigationEvent.navigationPopEvent());
    }
  }

  void navigateToHome([int index]) {
    add(NavigationEvent.navigateToHomeEvent(index: index));
  }

  void push(String route) {
    add(NavigationEvent.navigationPushEvent(route: route));
  }

  void pushRoute<T>(Route<T> route) {
    navigatorState.currentState.push(route);
  }

  Stream<NavigationState> _pop(NavigationPopEvent event) async* {
    navigatorState.currentState.pop();
  }

  Stream<NavigationState> _popWithValue(NavigationPopWithValueEvent event) async* {
    navigatorState.currentState.pop(event.value);
  }

  Stream<NavigationState> _navigateToHome(NavigateToHomeEvent event) async* {
    yield NavigationState.navigatorState(
      route: "/home/${event.index}",
      homeIndex: event.index
    );
  }

  Stream<NavigationState> _push(NavigationPushEvent event) async* {
    navigatorState.currentState.pushNamed(event.route);
  }
}