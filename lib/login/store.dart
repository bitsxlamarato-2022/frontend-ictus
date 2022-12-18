import 'package:ictus/login/actions.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class LoginState {
  final String name;
  final String pass;

  LoginState.init() :
        name = "",
        pass = "";

  LoginState(this.name,this.pass);

  LoginState copy({String? name, String? pass}) => LoginState(name ?? this.name,pass ?? this.pass);
}

AppState loginReducer(AppState prev, AppAction action) {
  switch (action.runtimeType) {
    case SubmitAction:
      var newAction = (action as SubmitAction);
      print("Usr: "+prev.loginState.name+"\nPass: "+prev.loginState.pass);
      break;
    case ChangeNameAction:
      var newAction = (action as ChangeNameAction);

      return prev.copy(
          loginState: prev.loginState.copy(name: newAction.variable));

    case ChangePassAction:
      var newAction = (action as ChangePassAction);

      return prev.copy(
          loginState: prev.loginState.copy(pass: newAction.variable));
    default:
      return prev;
  }
  return prev;
}
