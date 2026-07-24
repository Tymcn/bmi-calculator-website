// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'BMI Calculator';

  @override
  String get male => 'MALE';

  @override
  String get female => 'FEMALE';

  @override
  String get height => 'HEIGHT';

  @override
  String get weight => 'WEIGHT';

  @override
  String get age => 'AGE';

  @override
  String get calculate => 'CALCULATE';

  @override
  String get reCalculate => 'RE-CALCULATE';

  @override
  String get yourResult => 'Your Result';

  @override
  String get metric => 'Metric';

  @override
  String get imperial => 'Imperial';

  @override
  String get cm => 'cm';

  @override
  String get inch => 'in';

  @override
  String get kg => 'kg';

  @override
  String get lb => 'lb';

  @override
  String get overweight => 'Overweight';

  @override
  String get normal => 'Normal';

  @override
  String get underweight => 'Underweight';

  @override
  String get overweightInterpretation =>
      'You have a higher than normal body weight. Try to exercise more.';

  @override
  String get normalInterpretation => 'You have a normal body weight. Good job!';

  @override
  String get underweightInterpretation =>
      'You have a lower than normal body weight. You can eat a bit more.';

  @override
  String get history => 'History';
}
