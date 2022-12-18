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
            builder: (ctx, textController) =>
                StoreConnector<AppState, VoidCallback>(
              converter: (sto) => () {
                sto.dispatch(checkUser());
              },
              builder: (cto, onPressed) => Container(
                margin: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Username',
                      ),
                      onChanged: (text) => onChanged(text),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      onChanged: (text) => onChangedP(text),
                      controller: textController,
                    ),
                    StoreConnector<AppState, bool>(
                      converter: (sto) => sto.state.loginState.log_err,
                      builder: (ctx, log_err) => Visibility(
                        visible: log_err,
                        child: const Text(
                          "Wrong password or user",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo[600],
                        fixedSize: const Size(150, 50),
                      ),
                      onPressed: onPressed,
                      child: const Text(
                        "Login",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
