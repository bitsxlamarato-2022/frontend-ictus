import 'package:flutter/cupertino.dart';

import '../connection/store.dart';
import '../home/store.dart';
import 'actions.dart';

@immutable
class AppState {
  final WebServiceState webserviceState;
  final GlobalKey<NavigatorState> navigatorKey;
  final HomeState homeState;

  AppState.init()
      : webserviceState = const WebServiceState.init(),
        navigatorKey = GlobalKey<NavigatorState>(),
        homeState = HomeState.init();

  AppState(this.webserviceState, this.navigatorKey, this.homeState);

  AppState copy(
          {WebServiceState? webServiceState,
          GlobalKey<NavigatorState>? navigatorKey,
          HomeState? homeState}) =>
      AppState(webServiceState ?? webserviceState,
          navigatorKey ?? this.navigatorKey, homeState ?? this.homeState);
}

class AppAction {}

AppState reducer(AppState state, AppAction action) {
  switch (action.runtimeType) {
    default:
      return state;
  }
}

AppState navigationReducer(AppState prev, AppAction action) {
  switch (action.runtimeType) {
    case NavigateToNext:
      var newAction = action as NavigateToNext;
      GlobalKey<NavigatorState> navKey = prev.navigatorKey
        ..currentState!.pushNamed(newAction.destinationRoute);
      return prev.copy(navigatorKey: navKey);
    case NavigateToNextAndReplace:
      var newAction = action as NavigateToNextAndReplace;
      GlobalKey<NavigatorState> navKey = prev.navigatorKey
        ..currentState!.pushReplacementNamed(newAction.destinationRoute);
      return prev.copy(navigatorKey: navKey);
    case NavigateBack:
      GlobalKey<NavigatorState> navKey = prev.navigatorKey..currentState!.pop();
      return prev.copy(navigatorKey: navKey);
  }
  return prev;
}
