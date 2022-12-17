import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import '../store/store.dart';

ThunkAction<AppState> reloadProducts() {
  return (Store<AppState> store) async {
    return;
  };
}
