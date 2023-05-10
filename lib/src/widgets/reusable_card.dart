import 'package:flutter/material.dart';
import 'package:vaznim/data/constants.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard({required this.colour, this.cardChild, this.onPress});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;
  final Offset offset = const Offset(3, 3);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: colour,
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
        child: cardChild,
      ),
    );
  }
}
