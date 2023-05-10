import 'package:flutter/material.dart';

import '../../data/constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, required this.label, required this.iconColor});

  final IconData? icon;
  late final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: iconColor,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
