import 'package:flutter/material.dart';

class ChuDe extends ChangeNotifier {
  bool _themelaToi = false;

  bool get getThemelaToi => _themelaToi;

  ThemeData theme() {
    return _themelaToi ? ThemeData.light() : ThemeData.dark();
  }

  void thayDoiTheme() {
    _themelaToi = !_themelaToi;
    notifyListeners();
  }
}
