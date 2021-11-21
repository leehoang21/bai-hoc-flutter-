import 'package:flutter/material.dart';

class DemProvider extends ChangeNotifier {
  int _dem = 0;

  int get dem => _dem;

  void add() {
    _dem++;
    notifyListeners();
  }
}
