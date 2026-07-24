import 'package:flutter_test/flutter_test.dart';
import 'package:bmi_calculator/main.dart';

void main() {
  testWidgets('InputPage smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculator());

    // Verify app title exists (initially in English or device locale)
    expect(find.text('BMI Calculator'), findsWidgets);

    // Verify sections exist
    expect(find.text('HEIGHT'), findsOneWidget);
    expect(find.text('WEIGHT'), findsOneWidget);
    expect(find.text('AGE'), findsOneWidget);

    // Find and tap the CALCULATE button
    final calculateButton = find.text('CALCULATE');
    expect(calculateButton, findsOneWidget);

    await tester.tap(calculateButton);
    await tester.pumpAndSettle();

    // Verify we transitioned to the Results page
    expect(find.text('Your Result'), findsOneWidget);
  });
}
