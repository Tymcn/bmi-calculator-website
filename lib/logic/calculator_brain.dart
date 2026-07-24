import 'dart:math';

enum UnitSystem { metric, imperial }

class CalculatorBrain {
  CalculatorBrain({
    required this.height,
    required this.weight,
    this.unitSystem = UnitSystem.metric,
  });

  final double height;
  final double weight;
  final UnitSystem unitSystem;

  double _bmi = 0;

  String calculateBMI() {
    if (unitSystem == UnitSystem.metric) {
      // Metric: weight (kg) / [height (m)]^2
      _bmi = weight / pow(height / 100, 2);
    } else {
      // Imperial: 703 * weight (lb) / [height (in)]^2
      _bmi = 703 * weight / pow(height, 2);
    }
    return _bmi.toStringAsFixed(1);
  }

  bool isOverweight() => _bmi >= 25;
  bool isNormal() => _bmi > 18.5 && _bmi < 25;

  // We will pass localized strings from the UI instead of hardcoding them here
  // to follow best practices for localization.
}
