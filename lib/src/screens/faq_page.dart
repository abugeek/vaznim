import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vaznim/data/constants.dart';
import 'package:vaznim/src/widgets/expandable_card.dart';

import '../widgets/bmi_brand.dart';

class faqPage extends StatelessWidget {
  const faqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(
              left: 10.w,
              right: 10.w,
              top: 40.h,
            ),
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
                const BmiBrand(),
                const CircleAvatar(
                  backgroundColor: Colors.transparent,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 608.h,
            child: ListView(
              children: [
                ExpandableCardW(
                  questionText: AppLocalizations.of(context)!.q1,
                  answerText: AppLocalizations.of(context)!.a1,
                ),
                ExpandableCardW(
                  questionText: AppLocalizations.of(context)!.q2,
                  answerText: AppLocalizations.of(context)!.a2,
                ),
                ExpandableCardW(
                  questionText: AppLocalizations.of(context)!.q3,
                  answerText: AppLocalizations.of(context)!.a3,
                ),
                ExpandableCardW(
                  questionText: AppLocalizations.of(context)!.q4,
                  answerText: AppLocalizations.of(context)!.a4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
