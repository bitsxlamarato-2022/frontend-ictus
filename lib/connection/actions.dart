import 'package:ictus/connection/api.dart';
import 'package:ictus/store/actions.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../store/store.dart';
import 'dtos/user.dart';

ThunkAction<AppState> getECGByUserID() {
  return (Store<AppState> store) async {
    print(store.state.loginState);
    Future<UserDTO> userDTO = BackendAPIService().getECGbyUserID(store.state.loginState.id);
    userDTO.then((value) {
      store.dispatch(const NavigateToNextAndReplace(Routes.accepted));
    });
  };
}
