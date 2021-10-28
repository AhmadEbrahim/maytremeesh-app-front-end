import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int _counter = 1;
  //int _max;
  //int get max => _max;
  int get counter => _counter;

  set counter(int val) {
    _counter = val;
    notifyListeners();
  }

  /*set max(int val) {
    _max = val;
    notifyListeners();
  }*/

  increment(int max) {
    if (counter == max) {
      counter = counter;
    } else {
      counter = counter + 1;
    }
  }

  decrement() {
    if (counter == 1) {
      counter = counter;
    } else {
      counter = counter - 1;
    }
  }
}
