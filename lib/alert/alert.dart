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
          () => store.dispatch(const NavigateToNextAndReplace(Routes.home)),
      builder: (cto, goBack) => StoreConnector<AppState, VoidCallback>(
        converter: (store) => () => store.dispatch(getECGByUserID()),
        builder: (cto, acceptAlert) => Scaffold(
          body: Container(
            color: Colors.grey[400],
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Time to get and ECG!",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "Do you want to get an ECG and send it to your doctor??",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.green[800],
                          fixedSize: Size(150, 40),
                        ),
                        onPressed: acceptAlert,
                        child: Text("Yes"),
                      ),
                      SizedBox.fromSize(
                        size: Size(20, 70),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                          fixedSize: Size(150, 40),
                        ),
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
