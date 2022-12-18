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
        converter: (sto) => () => sto.dispatch(NavigateToNextAndReplace(Routes.profile)),
        builder:(cto, goProfile) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          ElevatedButton(
            style: TextButton.styleFrom(

              textStyle: const TextStyle(fontSize: 30),
            ),
            onPressed: goProfile,
            child: const Padding(
              padding: EdgeInsets.fromLTRB(180, 150, 0, 0),
              child: Center(
                child: Text('Perfil'),
              ),//aqui se li te que passar el nom del usuari per parametre
            ),
          ),
            const SizedBox(
              height: 50,
            ),
          ElevatedButton(
            style: TextButton.styleFrom(
              textStyle: const TextStyle(fontSize: 50),
              primary: Colors.grey[300],
              ),
            onPressed: goProfile,//TODO
            child: const Padding(
              padding: EdgeInsets.fromLTRB(0,0, 0, 0),
              child: Center(
                child: Text('Electrocardiograma'),
              ),
            ),
          ),//aqui se li te que passar el nom del usuari per parametre
        ],
      ),
    ));
  }
}
