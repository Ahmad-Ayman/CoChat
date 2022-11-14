import 'package:flutter/material.dart';

class AppColors {
  static Color mainColor1 = const Color(0xFF3A8891);
  static Map<int, Color> mainColor1List = {
    50: const Color.fromRGBO(58, 136, 145, .1),
    100: const Color.fromRGBO(58, 136, 145, .2),
    200: const Color.fromRGBO(58, 136, 145, .3),
    300: const Color.fromRGBO(58, 136, 145, .4),
    400: const Color.fromRGBO(58, 136, 145, .5),
    500: const Color.fromRGBO(58, 136, 145, .6),
    600: const Color.fromRGBO(58, 136, 145, .7),
    700: const Color.fromRGBO(58, 136, 145, .8),
    800: const Color.fromRGBO(58, 136, 145, .9),
    900: const Color.fromRGBO(58, 136, 145, 1),
  };

  static MaterialColor get mainColor1Material => MaterialColor(0xFF3A8891, mainColor1List);
  static Color mainColor2 = const Color(0xFF0E5E6F);
  static Color mainColor3 = const Color(0xFFFFEFD6);
  static Color mainColor4 = const Color(0xFFF2DEBA);
}
