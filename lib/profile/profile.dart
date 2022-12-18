import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:ictus/store/actions.dart';
import 'package:ictus/store/store.dart';

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StoreConnector<AppState, VoidCallback>(
      converter: (sto) =>
          () => sto.dispatch(NavigateToNextAndReplace(Routes.home)),
      builder: (cto, goHome) => Center(
        child: Container(
          color: Colors.indigo[50],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              AppBar(
                centerTitle: true,
                title: const Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                backgroundColor: Colors.indigo[900],
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: goHome,
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo[900])),
                  child: Text("Go Home",
                          style: TextStyle(color: Colors.white))),
              const SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.indigo[200],
                  ),
                  width: 350,
                  height: 470,
                  child: Align(
                      alignment: Alignment(-0.75, -0.75),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              width: 30,
                            ),
                            Container(
                                //color: Colors.amber,
                                width: 225,
                                height: 200,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Row(children: <Widget>[
                                        Text("Nom: "),
                                        Text("Pol")
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: <Widget>[
                                        Text("Cognoms: "),
                                        Text("Escolà Curcó")
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: <Widget>[
                                        Text("Sexe: "),
                                        Text("Masculi")
                                      ]),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(children: <Widget>[
                                        Text("Pes: "),
                                        Text("45"),
                                        Text("kg")
                                      ])
                                    ])),
                            ClipOval(

                              child: Material(
                                color: Colors.white60, // Button color

                                child: InkWell(

                                  child: Icon(
                                    Icons.person,
                                    size: 60,
                                  )
                                ),
                              ),
                            ),


                          ])))
            ],
          ),
        ),
      ),
    ));
  }
}
