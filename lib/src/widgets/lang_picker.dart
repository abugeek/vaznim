import 'package:flutter/material.dart';

import '../screens/drawer_page.dart';

class langChooser extends StatelessWidget {
  const langChooser({
    Key? key,
    required this.widget,
    required this.onTap,
    required this.text,
    required this.flagName,
  }) : super(key: key);

  final DrawerScreen widget;
  final VoidCallback? onTap;
  final String text;
  final String flagName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap?.call();
      },
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Image.asset(
            flagName,
            height: 25,
            width: 25,
          ),
        ],
      ),
    );
  }
}
