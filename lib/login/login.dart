import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/login/actions.dart';

import '../store/store.dart';

class LoginWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, dynamic Function(dynamic)>(
        converter: (sto) => (text) => sto.dispatch(ChangeNameAction(text)),
        builder: (cto, onChanged) =>  StoreConnector<AppState, VoidCallback>(
          converter: (sto) =>  () => sto.dispatch(SubmitAction()),
          builder: (cto, onPressed) => Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a search term',
                ),
                onChanged: (text) => onChanged(text),
              ),
              TextButton(
                onPressed: onPressed,
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
