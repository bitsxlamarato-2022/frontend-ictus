import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

import 'home/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, GlobalKey<NavigatorState>>(
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
        },
      ),
    );
  }
}

