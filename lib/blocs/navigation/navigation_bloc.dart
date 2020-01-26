import 'package:arava_app/blocs/navigation/event/navigation_event.dart';
import 'package:arava_app/blocs/navigation/state/navigation_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  final GlobalKey<NavigatorState> navigatorState;

  NavigationBloc({@required this.navigatorState});

  @override
  NavigationState get initialState => NavigationState.navigator(route: "/");

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) => event.when(
    pop: _pop,
    goToHome: _goToHome,
    push: _push
  );

  void pop() {
    add(NavigationEvent.pop());
  }

  void navigateToHome() {
    add(NavigationEvent.goToHome());
  }

  void push(String route) {
    add(NavigationEvent.push(route: route));
  }

  Stream<NavigationState> _pop(Pop event) async* {
    navigatorState.currentState.pop();
  }

  Stream<NavigationState> _goToHome(GoToHome event) async* {
    navigatorState.currentState.pushReplacementNamed("/");
  }

  Stream<NavigationState> _push(Push event) async* {
    navigatorState.currentState.pushNamed(event.route);
  }
}