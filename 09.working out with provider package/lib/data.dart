import 'package:flutter/foundation.dart';

class MyData with ChangeNotifier {
  String textTyped = "sample";

  void updateText(String newTextValue) {
    textTyped = newTextValue;
    notifyListeners();
  }
}
