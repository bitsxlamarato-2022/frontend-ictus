import 'dart:math';

import 'package:flutter/cupertino.dart';

import '../connection/store.dart';
import '../home/store.dart';
import '../login/store.dart';
import 'actions.dart';

@immutable
class AppState {
  final String title;
  final WebServiceState webserviceState;
  final GlobalKey<NavigatorState> navigatorKey;
  final HomeState homeState;
  final LoginState loginState;

  AppState.init()
      : title= "GUARRA",
        webserviceState = const WebServiceState.init(),
        navigatorKey = GlobalKey<NavigatorState>(),
        homeState = HomeState.init(),
        loginState = LoginState.init();

  AppState(this.title, this.webserviceState, this.navigatorKey, this.homeState, this.loginState);

  AppState copy(
          {String? title,
            WebServiceState? webServiceState,
          GlobalKey<NavigatorState>? navigatorKey,
          HomeState? homeState, LoginState? loginState}) =>
      AppState(title ?? this.title, webServiceState ?? webserviceState,
          navigatorKey ?? this.navigatorKey, homeState ?? this.homeState, loginState ?? this.loginState);
}

AppState appReducer(AppState state, AppAction action) {
  AppState newState = loginReducer(state, action);
  newState = navigationReducer(newState, action);
  return newState;
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
