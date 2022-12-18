import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_thunk/redux_thunk.dart';
import 'package:ictus/store/store.dart';
import '../store/actions.dart';
import '../store/store.dart';

class SubmitAction extends AppAction {
}
class ChangeNameAction extends AppAction {
  final String variable;

  ChangeNameAction(this.variable);
}
class ChangePassAction extends AppAction {
  final String variable;

  ChangePassAction(this.variable);
}

