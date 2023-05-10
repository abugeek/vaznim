import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/bmi_brand.dart';
import '../widgets/divider_widget.dart';
import '../widgets/icon_content.dart';
import '../widgets/reusable_card.dart';
import '../widgets/weight_slider/weight_card.dart';
import '../../data/constants.dart';
import '../screens/results_page.dart';
import '../widgets/bottom_button.dart';
import '../widgets/round_icon_button.dart';
import '../logic/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage(this.setLocale, {super.key});
  final void Function(Locale locale) setLocale;

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selectedGender = Gender.female;
  int height = 180;
  int weight = 60;
  int age = 20;

  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isDrawerOpen = false;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      transform: Matrix4.identity()
        ..translate(xOffset, yOffset)
        ..scale(scaleFactor)
        ..rotateY(isDrawerOpen ? 0.1 : 0),
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(isDrawerOpen ? 36.r : 0),
        boxShadow: [
          BoxShadow(
            color: drawerBlur,
            blurRadius: 5.r,
            //offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 40.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                isDrawerOpen
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            xOffset = 0;
                            yOffset = 0;
                            scaleFactor = 1;
                            isDrawerOpen = false;
                          });
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          setState(() {
                            isDrawerOpen = true;
                            xOffset = 195;
                            yOffset = 180;
                            scaleFactor = 0.9;
                          });
                        },
                        icon: const Icon(
                          Icons.menu,
                        ),
                      ),
                const BmiBrand(),
                IconButton(
                  onPressed: () {
                    CalculatorBrain calc = CalculatorBrain(
                        height: height, weight: weight, context: context);

                    Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.rightToLeftWithFade,
                        child: ResultsPage(
                          bmiResult: calc.calculateBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    FontAwesomeIcons.calculator,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  colour: selectedGender == Gender.male
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    iconColor: maleGender,
                    icon: FontAwesomeIcons.mars,
                    label: AppLocalizations.of(context)!.male,
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInActiveCardColor,
                  cardChild: IconContent(
                    iconColor: femaleGender,
                    icon: FontAwesomeIcons.venus,
                    label: AppLocalizations.of(context)!.female,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context)!.height,
                    style: kLabelTextStyle,
                  ),
                  const DividerWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        AppLocalizations.of(context)!.cm,
                        style: kLabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor: kInActiveCardColor,
                      activeTrackColor: mainBlue,
                      thumbColor: thumbColor,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 110.0,
                      max: 230.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: WeightCard(
                    onChanged: (int newValue) {
                      setState(() {
                        weight = newValue.round();
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          AppLocalizations.of(context)!.age,
                          style: kLabelTextStyle,
                        ),
                        const DividerWidget(),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onPressed: () {
                                setState(
                                  () {
                                    age--;
                                  },
                                );
                              },
                            ),
                            const SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: AppLocalizations.of(context)!.calculate,
            onTap: () {
              CalculatorBrain calc = CalculatorBrain(
                  height: height, weight: weight, context: context);

              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
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
