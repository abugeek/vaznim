import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';

import './faqPage.dart';
import '../constants.dart';
import '../screens/faqPage.dart';
import '../components/langChooser.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen(this.setLocale, {Key? key}) : super(key: key);
  final void Function(Locale locale) setLocale;

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final double sizedHeight = 15;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 60, bottom: 40, left: 15),
      color: mainBlue,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(
                  Icons.scale,
                  color: Colors.white,
                  size: 25,
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.bmiCalc,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                langChooser(
                  text: 'English',
                  flagName: 'images/en.png',
                  widget: widget,
                  onTap: () {
                    widget.setLocale(
                      const Locale.fromSubtags(
                        languageCode: 'en',
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: sizedHeight,
                ),
                langChooser(
                  text: 'Русский',
                  flagName: 'images/ru.png',
                  widget: widget,
                  onTap: () {
                    widget.setLocale(
                      const Locale.fromSubtags(
                        languageCode: 'ru',
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: sizedHeight,
                ),
                langChooser(
                  text: 'O\'zbekcha',
                  flagName: 'images/uz.png',
                  widget: widget,
                  onTap: () {
                    widget.setLocale(
                      const Locale.fromSubtags(
                        languageCode: 'uz',
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: InkWell(
              onTap: () => Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.fade,
                  child: faqPage(),
                ),
              ),
              child: Row(
                children: const [
                  Icon(
                    FontAwesomeIcons.solidCircleQuestion,
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'FAQ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
