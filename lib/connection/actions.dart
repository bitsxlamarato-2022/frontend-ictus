import 'package:ictus/connection/api.dart';
import 'package:ictus/login/actions.dart';
import 'package:ictus/store/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../store/store.dart';
import 'dtos/user.dart';

ThunkAction<AppState> getECGByUserID() {
  return (Store<AppState> store) async {
    Future<double> userDTO = BackendAPIService().getECGbyUserID(store.state.loginState.id);
    userDTO.then((value) {
      store.dispatch(const NavigateToNextAndReplace(Routes.accepted));
    });
  };
}

ThunkAction<AppState> checkUser() {
  return (Store<AppState> store) async {
    store.dispatch(CleanErrorAction());
    Future<bool> userDTO = BackendAPIService().checkUser(store.state.loginState.id, store.state.loginState.pass);
    userDTO.then((value) {
      if (value) {
        store.dispatch(const NavigateToNextAndReplace(Routes.accepted));

      }
      else {
        //store.dispatch(ErrorLoginAction());
        store.dispatch(ErrorLoginAction());
        store.dispatch(ClearPasswordText());
      }
    });
  };
}