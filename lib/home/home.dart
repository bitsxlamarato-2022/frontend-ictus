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
      body: StoreConnector<AppState, VoidCallback>(
        converter: (sto) => () => sto.dispatch(NavigateToNextAndReplace(Routes.profile)),
        builder:(cto, goProfile) => Column(

          children: <Widget>[
          const SizedBox(
            height: 0,
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 50),
            ),
            onPressed: goProfile,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(150, 250, 0, 0),
              child: Text('Perfil'),//aqui se li te que passar el nom del usuari per parametre
            ),
          ),
        ],
      ),
    ));
  }
}
