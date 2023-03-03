import 'dart:math';

class CalculaterBrain {
  final int weight;
  final int height;

  late double _bmi;

  CalculaterBrain({required this.weight, required this.height});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "OVERWEIGHT";
    } else if (_bmi > 18.5) {
      return "NORMAL";
    } else {
      return "UNDERWEIGHT";
    }
  }

  String getFinalResult() {
    if (_bmi >= 25) {
      return "You are overwight, eat more salad bro";
    } else if (_bmi > 18.5) {
      return "Your are normal, keep up the good work";
    } else {
      return "You are thin, you should eat more";
    }
  }
}
