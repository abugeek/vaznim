import 'package:flutter/material.dart';

import '../../data/constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.buttonTitle});

  final VoidCallback? onTap;
  final String buttonTitle;
  final bool _isElevated = false;
  final Offset offset = const Offset(3, 3);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        margin: const EdgeInsets.all(10),
        width: double.infinity,
        height: kBottomContainerHeight,
        decoration: BoxDecoration(
          color: mainBlue,
          borderRadius: kBorderRadius,
          boxShadow: _isElevated
              ? [
                  BoxShadow(
                    color: Colors.grey.shade600,
                    offset: offset,
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: Colors.white,
                    offset: -offset,
                    blurRadius: 15,
                    spreadRadius: 1,
                  ),
                ]
              : null,
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
