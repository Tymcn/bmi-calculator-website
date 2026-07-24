// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get appTitle => 'BMI Hesaplayıcı';

  @override
  String get male => 'ERKEK';

  @override
  String get female => 'KADIN';

  @override
  String get height => 'BOY';

  @override
  String get weight => 'KİLO';

  @override
  String get age => 'YAŞ';

  @override
  String get calculate => 'HESAPLA';

  @override
  String get reCalculate => 'YENİDEN HESAPLA';

  @override
  String get yourResult => 'Sonucunuz';

  @override
  String get metric => 'Metrik';

  @override
  String get imperial => 'İmparatorluk';

  @override
  String get cm => 'cm';

  @override
  String get inch => 'in';

  @override
  String get kg => 'kg';

  @override
  String get lb => 'lb';

  @override
  String get overweight => 'Fazla Kilolu';

  @override
  String get normal => 'Normal';

  @override
  String get underweight => 'Zayıf';

  @override
  String get overweightInterpretation =>
      'Normalden daha yüksek bir vücut ağırlığına sahipsiniz. Daha fazla egzersiz yapmaya çalışın.';

  @override
  String get normalInterpretation =>
      'Normal bir vücut ağırlığına sahipsiniz. İyi iş!';

  @override
  String get underweightInterpretation =>
      'Normalden daha düşük bir vücut ağırlığına sahipsiniz. Biraz daha fazla yiyebilirsiniz.';

  @override
  String get history => 'Geçmiş';
}
