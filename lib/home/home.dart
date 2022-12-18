import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class HomeWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StoreConnector<AppState, VoidCallback>(
        converter: (sto) =>
            () => sto.dispatch(NavigateToNextAndReplace(Routes.profile)),
        builder:(cto, goProfile) => StoreConnector<AppState, VoidCallback>(
          converter: (sto) => () => sto.dispatch(NavigateToNextAndReplace(Routes.alert)),
          builder: (cto, goHistory) => Center(
            child: Container(
              color: Colors.indigo[50],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  AppBar(
                    centerTitle: true,
                    title: const Text(
                        "Home",
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    backgroundColor: Colors.indigo[900],
                  ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[900],
                    fixedSize: const Size(350, 270),
                  ),
                  onPressed: goProfile,
                  child: const Center(
                    child: Text(
                      "My profile",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                  ),
                ),
                  const SizedBox(
                    height: 30,
                  ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.indigo[400],
                    fixedSize: const Size(350, 270),
                  ),
                  onPressed: goHistory,
                  child: const Center(
                    child: Text(
                      "My historial",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                    ),

                  ),
                ),
              ],
      ),
            ),
          ),
        ),
    ));
  }
}
