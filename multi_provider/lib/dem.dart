import 'package:flutter/material.dart';

class Dem extends ChangeNotifier {
  int _dem = 0;
  int get dem => _dem;

  void add() {
    _dem++;
    notifyListeners();
  }
}
