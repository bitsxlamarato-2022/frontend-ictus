import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/historial/store.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class HistorialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VoidCallback>(
      converter: (store) =>
          () => store.dispatch(NavigateToNextAndReplace(Routes.home)),
      builder: (ctx, goHome) => StoreConnector<AppState, HistorialState>(
        converter: (sto) => sto.state.historialState,
        builder: (ctx, historialState) => Container(
          color: Colors.indigo[50],
          child: Column(
            children: [
              AppBar(
                title: const Text("Your ECG",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                backgroundColor: Colors.indigo[800],
              ),
              historialState.imgHref != ""
                  ? Image.network(historialState.imgHref)
                  : Container(),
              const SizedBox(height: 40),
              Text("Date: " + historialState.date,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.indigo[800],
                  fixedSize: Size(150, 40),
                ),
                onPressed: goHome,
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
