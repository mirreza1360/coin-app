import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int counter = 0;

  incrementCounter() {
    counter++;
    notifyListeners();
  }

  decrementCounter() {
    if (counter > 0) {
      counter--;
    }
    notifyListeners();
  }
}
