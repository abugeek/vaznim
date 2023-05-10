import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../data/constants.dart';
import '../widgets/reusable_card.dart';
import '../widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.yourResult,
                    style: kTitleTextStyle,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      FontAwesomeIcons.calculator,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.yourbmi,
                    //resultText.toUpperCase(),
                    style: kResultTextStyle,
                  ),
                  Column(
                    children: [
                      Text(
                        bmiResult,
                        style: kBMITextStyle,
                      ),
                      Text(
                        '($resultText)',
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: kBodyTextStyle,
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            buttonTitle: AppLocalizations.of(context)!.reCalculate,
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
