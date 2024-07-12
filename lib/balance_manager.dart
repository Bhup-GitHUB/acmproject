import 'package:flutter/material.dart';

class BalanceManager extends ChangeNotifier {
  double _mainBalance = 0.0; 

  double get mainBalance => _mainBalance;

  void addAmount(double amount) {
    _mainBalance += amount;
    notifyListeners();
  }
}
