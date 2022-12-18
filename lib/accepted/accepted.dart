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
          color: Colors.indigo[50],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                    "Data sent correctly!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[800],
                    fixedSize: Size(150, 50),
                  ),
                  onPressed: goBack,
                  child: const Text(
                      "Ok",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}