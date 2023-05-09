import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/constants.dart';

class ExpandableCardW extends StatelessWidget {
  final String questionText;
  final String answerText;
  const ExpandableCardW({
    super.key,
    required this.questionText,
    required this.answerText,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kActiveCardColor,
      elevation: 4,
      margin: EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 5.h),
      shape: RoundedRectangleBorder(
        borderRadius: kBorderRadius,
      ),
      clipBehavior: Clip.hardEdge,
      child: ExpansionTile(
        childrenPadding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 10.h),
        title: Text(
          questionText,
          style: expansionCardTitle,
          textScaleFactor: 1.1,
        ),
        children: [
          Text(
            answerText,
            style: expansionCardSubt,
            selectionColor: Colors.red,
          ),
        ],
      ),
    );
  }
}
