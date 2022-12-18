import 'package:ictus/login/actions.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class LoginState {
  final String id;

  LoginState.init() : id = "string";

  LoginState(this.id);

  LoginState copy({String? name}) => LoginState(name ?? this.id);
}

AppState loginReducer(AppState prev, AppAction action) {
  switch (action.runtimeType) {
    case SubmitAction:
      var newAction = (action as SubmitAction);
      //print(prev.loginState.name);
      break;
    case ChangeNameAction:
      var newAction = (action as ChangeNameAction);

      return prev.copy(
          loginState: prev.loginState.copy(name: newAction.variable));
    default:
      return prev;
  }
  return prev;
}
