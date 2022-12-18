import 'package:ictus/connection/api.dart';
import 'package:ictus/store/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../store/store.dart';
import 'dtos/user.dart';

ThunkAction<AppState> getECGByUserID() {
  return (Store<AppState> store) async {
    Future<double> userDTO = BackendAPIService().getECGbyUserID(store.state.loginState.name);
    userDTO.then((value) {
      store.dispatch(const NavigateToNextAndReplace(Routes.accepted));
    });
  };
}
