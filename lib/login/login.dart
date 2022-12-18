import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/connection/actions.dart';
import 'package:ictus/login/actions.dart';

import '../store/store.dart';

class LoginWidget extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, dynamic Function(dynamic)>(
      converter: (sto) => (pass) => sto.dispatch(ChangePassAction(pass)),
      builder: (cto, onChangedP) =>
          StoreConnector<AppState, dynamic Function(dynamic)>(
          converter: (sto) => (usr) => sto.dispatch(ChangeNameAction(usr)),
          builder: (cto, onChanged) =>
            StoreConnector<AppState, TextEditingController>(
              converter: (sto) => sto.state.loginState.fieldTextController,
              builder: (ctx, textController) => StoreConnector<AppState, VoidCallback>(
              converter: (sto) =>  () {
                sto.dispatch(checkUser());
              },
              builder: (cto, onPressed) =>
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Username',
                    ),
                    onChanged: (text) => onChanged(text),
                  ),
                  TextField(
                    obscureText : true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Password',

                    ),
                    onChanged: (text) => onChangedP(text),
                    controller: textController,
                  ),

                  StoreConnector<AppState, bool>(
                    converter: (sto) => sto.state.loginState.log_err,
                    builder: (ctx, log_err) => Visibility(
                      child: Text("Wrong password or user",
                        style: TextStyle(color: Colors.red),),
                      visible: log_err,


                    ),
                  ),
                  TextButton(
                    onPressed: onPressed,
                    child: Text("Submit"),
                  ),
                ],
              ),
          ),
            ),
        ),
      ),
    );
  }
}
