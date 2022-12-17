import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

import 'home/home.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

import 'profile/profile.dart';

void main() {
  final store = Store<AppState>((x, a) => appReducer(x, a),
      initialState: AppState.init(), middleware: [thunkMiddleware]);
  runApp(MyApp(store: store));
}


class Mock extends StatelessWidget {
  final Store<AppState> store;

  const Mock({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return HomeWidget();
  }
  
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  const MyApp({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: StoreConnector<AppState, GlobalKey<NavigatorState>>(
        converter: (sto) => sto.state.navigatorKey,
        builder: (context, navKey) => MaterialApp(
          title: 'Flutter Demo',
          navigatorKey: navKey,
          theme: ThemeData(
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: Container(),
          initialRoute: Routes.home,
          routes: {
            Routes.home: (c) => HomeWidget(),
            Routes.profile: (c) => ProfileWidget(),
          },
        ),
      ),
    );
  }
}

