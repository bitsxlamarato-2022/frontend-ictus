import 'package:flutter/cupertino.dart';
import 'package:ictus/login/actions.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class LoginState {
  final String id;
  final String pass;
  final bool log_err;
  final TextEditingController fieldTextController;

  LoginState.init()
      : id = "",
        pass = "",
        log_err = false,
        fieldTextController = TextEditingController();

  LoginState(this.id, this.pass, this.log_err, this.fieldTextController);

  LoginState copy(
          {String? name,
          String? pass,
          bool? log_err,
          TextEditingController? fieldTextController}) =>
      LoginState(name ?? this.id, pass ?? this.pass, log_err ?? this.log_err,
          fieldTextController ?? this.fieldTextController);
}

AppState loginReducer(AppState prev, AppAction action) {
  switch (action.runtimeType) {
    case ErrorLoginAction:
      return prev.copy(loginState: prev.loginState.copy(log_err: true));
    case CleanErrorAction:
      return prev.copy(loginState: prev.loginState.copy(log_err: false));
    case ChangeNameAction:
      var newAction = (action as ChangeNameAction);

      return prev.copy(
          loginState: prev.loginState.copy(name: newAction.variable));

    case ChangePassAction:
      var newAction = (action as ChangePassAction);
      print(action.variable);
      return prev.copy(
          loginState: prev.loginState.copy(pass: newAction.variable));
    case ClearPasswordText:
      prev.loginState.fieldTextController.clear();
      return prev;
    default:
      return prev;
  }
  return prev;
}
