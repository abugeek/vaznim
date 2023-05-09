import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:vaznim/data/constants.dart';

import '../card_title.dart';
import '../../utils/widget_utils.dart';
import 'weight_slider.dart';

class WeightCard extends StatefulWidget {
  final int weight;
  final ValueChanged<int> onChanged;

  const WeightCard({
    Key? key,
    this.weight = 70,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<WeightCard> createState() => _WeightCardState();
}

const Offset offset = Offset(1, 2.5);

class _WeightCardState extends State<WeightCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: kBorderRadius,
        boxShadow: [
          BoxShadow(
            color: boxShadow1,
            offset: offset,
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: boxShadow2,
            offset: -offset,
            blurRadius: 15,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: kBorderRadius,
        ),
        margin: EdgeInsets.only(
          left: screenAwareSize(10.0, context),
          right: screenAwareSize(10.0, context),
          top: screenAwareSize(10.0, context),
          bottom: screenAwareSize(10, context),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CardTitle(
              AppLocalizations.of(context)!.weight,
              subtitle: AppLocalizations.of(context)!.kg,
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenAwareSize(15.0, context)),
                  child: _drawSlider(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _drawSlider() {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : WeightSlider(
                  minValue: 30,
                  maxValue: 150,
                  value: widget.weight,
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged(value);
                    });
                  },
                  width: constraints.maxWidth,
                );
        },
      ),
    );
  }
}

class WeightBackground extends StatelessWidget {
  final Widget child;

  const WeightBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: screenAwareSize(100.0, context),
          decoration: BoxDecoration(
            color: weightCardBackColor,
            borderRadius: BorderRadius.circular(screenAwareSize(50.0, context)),
          ),
          child: child,
        ),
        SvgPicture.asset(
          "images/weight_arrow.svg",
          color: mainBlue,
          height: screenAwareSize(10.0, context),
          width: screenAwareSize(18.0, context),
        ),
      ],
    );
  }
}
