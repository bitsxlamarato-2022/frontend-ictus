

import 'package:flutter/cupertino.dart';


class Routes {
  static const String home = "HOME";
  static const String profile = 'PROFILE';
  static const String alert = "ALERT";
  static const String login = "LOGIN";
  static const String accepted = "ACCEPTED";
  static const String historial = "HISTORIAL";
}

@immutable
abstract class AppAction {
  const AppAction();
}

class NavigateToNext extends AppAction {
  final String destinationRoute;

  const NavigateToNext(this.destinationRoute);
}

class NavigateToNextAndReplace extends AppAction {
  final String destinationRoute;

  const NavigateToNextAndReplace(this.destinationRoute);
}

class NavigateBack extends AppAction {}


