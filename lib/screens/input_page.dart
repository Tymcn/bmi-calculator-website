import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../logic/calculator_brain.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../components/round_icon_button.dart';
import '../constants.dart';
import '../components/icon_content.dart';
import '../logic/ad_helper.dart';
import 'result_page.dart';
import 'history_page.dart';
import '../l10n/app_localizations.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key, required this.title});

  final String title;

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  UnitSystem unitSystem = UnitSystem.metric;
  
  int height = 180;
  int weight = 60;
  int age = 20;

  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    _loadBannerAd();
  }

  void _loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {});
        },
        onAdFailedToLoad: (ad, error) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  void toggleUnit(UnitSystem? newUnit) {
    if (newUnit != null) {
      setState(() {
        unitSystem = newUnit;
        if (unitSystem == UnitSystem.imperial) {
          height = (height / 2.54).round();
          weight = (weight * 2.205).round();
        } else {
          height = (height * 2.54).round();
          weight = (weight / 2.205).round();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HistoryPage()),
              );
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(l10n.metric, style: kLabelTextStyle),
                Switch(
                  value: unitSystem == UnitSystem.imperial,
                  onChanged: (value) {
                    toggleUnit(value ? UnitSystem.imperial : UnitSystem.metric);
                  },
                ),
                Text(l10n.imperial, style: kLabelTextStyle),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      HapticFeedback.lightImpact();
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      label: l10n.male,
                      icons: FontAwesomeIcons.mars,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      HapticFeedback.lightImpact();
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInactiveCardColour,
                    cardChild: IconContent(
                      label: l10n.female,
                      icons: FontAwesomeIcons.venus,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(l10n.height, style: kLabelTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(height.toString(), style: kNumberTextStyle),
                      Text(unitSystem == UnitSystem.metric ? l10n.cm : l10n.inch, 
                           style: kLabelTextStyle),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: unitSystem == UnitSystem.metric ? 120.0 : 47.0,
                    max: unitSystem == UnitSystem.metric ? 220.0 : 87.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.weight, style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(weight.toString(), style: kNumberTextStyle),
                            Text(unitSystem == UnitSystem.metric ? l10n.kg : l10n.lb, 
                                 style: kLabelTextStyle),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                setState(() {
                                  if (weight > 0) weight--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColour,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.age, style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                HapticFeedback.lightImpact();
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_bannerAd != null)
            SizedBox(
              width: _bannerAd!.size.width.toDouble(),
              height: _bannerAd!.size.height.toDouble(),
              child: AdWidget(ad: _bannerAd!),
            ),
          BottomButton(
            buttonTitle: l10n.calculate,
            onTap: () {
              HapticFeedback.mediumImpact();
              CalculatorBrain calc = CalculatorBrain(
                height: height.toDouble(),
                weight: weight.toDouble(),
                unitSystem: unitSystem,
              );
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.isOverweight() 
                        ? l10n.overweight 
                        : (calc.isNormal() ? l10n.normal : l10n.underweight),
                    interpretation: calc.isOverweight() 
                        ? l10n.overweightInterpretation 
                        : (calc.isNormal() ? l10n.normalInterpretation : l10n.underweightInterpretation),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
