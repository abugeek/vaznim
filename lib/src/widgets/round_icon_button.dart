import 'package:flutter/material.dart';

import '../../data/constants.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      //padding: EdgeInsets.all(5.0),
      elevation: 0.0,
      onPressed: onPressed,
      constraints: const BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: const CircleBorder(),
      fillColor: weightCardBackColor,
      child: Icon(
        icon,
        //color: Color(0xFF4E7AF3),
      ),
    );
  }
}
