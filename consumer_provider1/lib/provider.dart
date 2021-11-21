import 'package:flutter/widgets.dart';

class Dem extends ChangeNotifier {
  int _dem = 0;

  int get dem => _dem;

  void demCong1() {
    _dem++;
    notifyListeners();
  }

  void demTru1() {
    _dem--;
    notifyListeners();
  }
}
