import 'package:flutter/material.dart';
import 'package:vaznim/data/constants.dart';
import 'package:vaznim/src/widgets/divider_widget.dart';

import '../utils/widget_utils.dart';

const TextStyle _titleStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w600,
  color: textColorDarkBlue,
);

const TextStyle _subtitleStyle = TextStyle(
  fontSize: 11.0,
  color: Color.fromRGBO(143, 144, 156, 1.0),
);

class CardTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const CardTitle(this.title, {Key? key, required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            top: screenAwareSize(6.0, context),
            left: screenAwareSize(13.0, context),
            right: screenAwareSize(11.0, context),
            bottom: screenAwareSize(6.0, context),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: _titleStyle,
              ),
              Text(
                subtitle,
                style: _subtitleStyle,
              )
            ],
          ),
        ),
        const DividerWidget(),
      ],
    );
  }
}
