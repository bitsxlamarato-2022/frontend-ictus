import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

import '../connection/actions.dart';
import '../store/actions.dart';
import '../store/store.dart';

//funcion que muestra una pregunta con dos botones de si o no
//si presionas no, se redirige a la pagina de home

class AlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) =>
          () => store.dispatch(NavigateToNextAndReplace(Routes.home)),
      builder: (cto, goBack) => StoreConnector<AppState, VoidCallback>(
        converter: (store) => () {
         // store.dispatch(SendToModel());
          store.dispatch(NavigateToNextAndReplace(Routes.home));
        },
        builder: (cto, acceptAlert) => Scaffold(
          body: Container(
            color: Colors.grey[400],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Time to get and ECG!"),
                  Text("Do you want to get an ECG and send it to your doctor??"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: acceptAlert,
                        child: Text("Yes"),
                      ),
                      ElevatedButton(
                        onPressed: goBack,
                        child: Text("No"),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
