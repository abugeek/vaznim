import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vaznim/components/expandableCard.dart';

class faqPage extends StatelessWidget {
  const faqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Container(
        color: Colors.grey.shade200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 40),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //const Text('BMI Calculator'),
                      Row(
                        children: [
                          const CircleAvatar(
                            foregroundColor: Colors.blue,
                            backgroundColor: Colors.transparent,
                            child: Icon(
                              Icons.scale_rounded,
                              size: 30,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'BMI Calculator',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF0F163B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Be Fit - Be Healthy',
                                style: TextStyle(
                                  color: Color(0xFF0F163B),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundColor: Colors.transparent,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: expandableCard(
                        questionText: AppLocalizations.of(context)!.firstQ,
                        answerText: AppLocalizations.of(context)!.firstA,
                      ),
                    ),
                    Expanded(
                      child: expandableCard(
                        questionText: AppLocalizations.of(context)!.secondQ,
                        answerText: AppLocalizations.of(context)!.secondA,
                      ),
                    ),
                    Expanded(
                      child: expandableCard(
                        questionText: AppLocalizations.of(context)!.thirdQ,
                        answerText: AppLocalizations.of(context)!.thirdA,
                      ),
                    ),
                    Expanded(
                      child: expandableCard(
                        questionText: AppLocalizations.of(context)!.fourthQ,
                        answerText: AppLocalizations.of(context)!.fourthA,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /* Expanded(
              child: Container(
                color: Colors.transparent,
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ), */
          ],
        ),
      ),
    );
  }
}
