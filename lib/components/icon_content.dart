import 'package:flutter/material.dart';

import '../constants.dart';

class IconContent extends StatelessWidget {
  IconContent({this.icon, required this.label});

  final IconData? icon;
  late final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
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
