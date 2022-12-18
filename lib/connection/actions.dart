import 'package:ictus/connection/api.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../store/store.dart';

ThunkAction<AppState> sendUserId() {
  return (Store<AppState> store) async {
    BackendAPIService().sendUserId("");
    return;
  };
}
