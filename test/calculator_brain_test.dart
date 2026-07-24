import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/logic/calculator_brain.dart';

void main() {
  group('CalculatorBrain Metric Tests', () {
    test('BMI calculation for normal weight', () {
      final calc = CalculatorBrain(height: 180, weight: 70, unitSystem: UnitSystem.metric);
      expect(calc.calculateBMI(), '21.6');
      expect(calc.isNormal(), true);
      expect(calc.isOverweight(), false);
    });

    test('BMI calculation for overweight', () {
      final calc = CalculatorBrain(height: 170, weight: 80, unitSystem: UnitSystem.metric);
      expect(calc.calculateBMI(), '27.7');
      expect(calc.isOverweight(), true);
    });
  });

  group('CalculatorBrain Imperial Tests', () {
    test('BMI calculation for normal weight (Imperial)', () {
      // 160 lbs, 70 inches -> BMI ~ 22.9
      final calc = CalculatorBrain(height: 70, weight: 160, unitSystem: UnitSystem.imperial);
      expect(calc.calculateBMI(), '23.0');
      expect(calc.isNormal(), true);
    });
  });
}
