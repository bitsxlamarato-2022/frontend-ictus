import 'package:ictus/connection/api.dart';
import 'package:ictus/connection/dtos/ExecuteDTO.dart';
import 'package:ictus/historial/actions.dart';
import 'package:ictus/login/actions.dart';
import 'package:ictus/store/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../store/store.dart';
import 'dtos/user.dart';

ThunkAction<AppState> getECGByUserID() {
  return (Store<AppState> store) async {
    const String beforeDate = "2022-09-28";
    Future<ExecuteDTO> executeDTO = BackendAPIService()
        .getECGbyUserID(store.state.loginState.id, beforeDate);
    executeDTO.then((value) {
      store.dispatch(SetImgAndDate(value.imghref, value.date));
      store.dispatch(const NavigateToNextAndReplace(Routes.accepted));
    });
  };
}

ThunkAction<AppState> checkUser() {
  return (Store<AppState> store) async {
    Future<bool> userDTO = BackendAPIService()
        .checkUser(store.state.loginState.id, store.state.loginState.pass);
    print("ID:" + store.state.loginState.id);
    print("PASS:" + store.state.loginState.pass);
    userDTO.then((value) {
      print("Value: " + value.toString());
      if (value) {
        store.dispatch(const NavigateToNextAndReplace(Routes.home));
      } else {
        store.dispatch(ErrorLoginAction());
      }
    });
  };
}
