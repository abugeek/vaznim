import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      //padding: EdgeInsets.all(5.0),
      elevation: 0.0,
      child: Icon(
        icon,
        //color: Color(0xFF4E7AF3),
      ),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color.fromRGBO(244, 244, 244, 1.0),
    );
  }
}
