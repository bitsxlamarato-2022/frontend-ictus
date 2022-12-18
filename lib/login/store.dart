import 'package:ictus/login/actions.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class LoginState {
  final String id;
  final String pass;

  LoginState.init()
      : id = "",
        pass = "";

  LoginState(this.id, this.pass);

  LoginState copy({String? id, String? pass}) =>
      LoginState(id ?? this.id, pass ?? this.pass);
}

AppState loginReducer(AppState prev, AppAction action) {
  switch (action.runtimeType) {
    case SubmitAction:
      var newAction = (action as SubmitAction);
      print("Usr: " + prev.loginState.id + "\nPass: " + prev.loginState.pass);
      break;
    case ChangeNameAction:
      var newAction = (action as ChangeNameAction);

      return prev.copy(
          loginState: prev.loginState.copy(id: newAction.variable));

    case ChangePassAction:
      var newAction = (action as ChangePassAction);

      return prev.copy(
          loginState: prev.loginState.copy(pass: newAction.variable));
    default:
      return prev;
  }
  return prev;
}
