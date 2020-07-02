import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  double _bmi;

  // New formula: BMI =
  // 1.3*weight(kg)/height(m)^2.5 =
  // 5734*weight(lb)/height(in)^2.5

  String calculation() {
    _bmi = 1.3 * weight / pow(height / 100, 2.5);
    return _bmi.toStringAsFixed(2);
  }

  String resultText() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getFeedback() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
