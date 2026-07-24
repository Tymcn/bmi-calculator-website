import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/bottom_button.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../logic/history_service.dart';
import '../l10n/app_localizations.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({
    super.key,
    required this.bmiResult,
    required this.interpretation,
    required this.resultText,
  });

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final HistoryService _historyService = HistoryService();

  @override
  void initState() {
    super.initState();
    // Save the result to history when page is shown
    _historyService.saveResult(widget.bmiResult, widget.resultText);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(l10n.yourResult, style: kTitleTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColour,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Text(
                    widget.bmiResult,
                    style: kBMITextStyle,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      widget.interpretation,
                      textAlign: TextAlign.center,
                      style: kBodyTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: l10n.reCalculate,
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
