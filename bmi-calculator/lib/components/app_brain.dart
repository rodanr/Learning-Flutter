import 'package:flutter/material.dart';
import '../screens/input_page.dart';

class AppBrain {
  InputPage inputPage = InputPage();
  Color levelStageColor;
  double _bmiIndex = 0.0;
  String _remarks;
  double getBmiIndex() {
    _bmiIndex = (inputPage.weightInKg().toInt()) /
        ((inputPage.getHeightInCm() / 100) * (inputPage.getHeightInCm() / 100));
    return _bmiIndex;
  }

  String getLevelStage() {
    if (_bmiIndex < 18.5) {
      levelStageColor = Colors.blue;
      _remarks = 'Eat More but healthy';
      return 'UnderWeight';
    } else if (_bmiIndex >= 18.5 && _bmiIndex < 25) {
      levelStageColor = Colors.green;
      _remarks = 'Maintain this lifestyle';
      return 'Normal';
    } else {
      levelStageColor = Colors.red;
      _remarks = 'Eat less often and add exercise if you want';
      return 'OverWeight';
    }
  }

  String getRemarks() {
    return _remarks;
  }

  Color getLevelStageColor() {
    return levelStageColor;
  }
}
