import 'package:flutter/material.dart';

import '../../data/constants.dart';

class BmiBrand extends StatelessWidget {
  const BmiBrand({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              foregroundColor: mainBlue,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.scale_rounded,
                size: 30,
              ),
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('BMI Calculator', style: bmiCalcStyle1),
                Text('Be Fit - Be Healthy', style: bmiCalcStyle2),
              ],
            )
          ],
        ),
      ],
    );
  }
}
