import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight, required this.context});

  final int? height;
  final int? weight;
  final BuildContext context;

  late double _bmi;

  String calculateBMI() {
    _bmi = (weight ?? 0) / pow((height ?? 0) / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return AppLocalizations.of(context)!.overweight;
    } else if (_bmi > 18.5) {
      return AppLocalizations.of(context)!.normal;
    } else {
      return AppLocalizations.of(context)!.underweight;
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return AppLocalizations.of(context)!.overText;
    } else if (_bmi >= 18.5) {
      return AppLocalizations.of(context)!.normalText;
    } else {
      return AppLocalizations.of(context)!.underText;
    }
  }
}
