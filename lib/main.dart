import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'screens/input_page.dart';
import 'constants.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
        ),
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: kSliderActiveColor,
          inactiveTrackColor: kSliderInactiveColor,
          thumbColor: kSliderThumbColor,
          overlayColor: kSliderOverlayColor,
          thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
          overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
        ),
      ),
      home: const InputPage(title: 'BMI Calculator'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
