import 'package:flutter/cupertino.dart';

@immutable
class HomeState {
  final String abc;

  HomeState(this.abc);

  HomeState.init() : abc = "";

  HomeState copy({String? abc}) => HomeState(abc ?? this.abc);
}
