import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class ProfileWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: <Widget>[
              const SizedBox(
                height: 0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 50),
                ),
                onPressed:null,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: Text('caca'),//aqui se li te que passar el nom del usuari per parametre
                ),
              ),
           ],
        ),
        );
  }
}
