import 'package:flutter/cupertino.dart';

import '../connection/store.dart';

@immutable
class AppState {
  final WebServiceState webserviceState;

  const AppState.init() : webserviceState = const WebServiceState.init();
}

class AppAction {

}

AppState reducer(AppState state, AppAction action) {
  switch (action.runtimeType) {
    default:
      return state;
  }
}
