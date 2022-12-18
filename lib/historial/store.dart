import 'package:flutter/cupertino.dart';

import '../store/actions.dart';
import '../store/store.dart';
import 'actions.dart';

@immutable
class HistorialState {
  final String imgHref;
  final String date;

  HistorialState(this.imgHref, this.date);

  HistorialState.init()
      : imgHref = "",
        date = "";

  HistorialState copy({String? imgHref, String? date}) {
    return HistorialState(imgHref ?? this.imgHref, date ?? this.date);
  }
}

AppState historialReducer(AppState prev, AppAction action) {
  switch (action.runtimeType) {
    case SetImgAndDate:
      var newAction = (action as SetImgAndDate);
      return prev.copy(
          historialState: prev.historialState
              .copy(imgHref: "http://192.168.43.16:9999" + newAction.img, date: newAction.date));
  }
  return prev;
}
