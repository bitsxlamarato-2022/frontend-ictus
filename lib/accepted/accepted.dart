import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../connection/actions.dart';
import '../store/actions.dart';
import '../store/store.dart';

//funcion que genera un popup de datos enviados correctamente
//si presionas ok, se redirige a la pagina de home
class AcceptedWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) =>
          () => store.dispatch(NavigateToNextAndReplace(Routes.home)),
      builder: (cto, goBack) => Scaffold(
        body: Container(
          color: Colors.grey[400],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Data sent correctly!"),
                ElevatedButton(
                  onPressed: goBack,
                  child: Text("Ok"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}