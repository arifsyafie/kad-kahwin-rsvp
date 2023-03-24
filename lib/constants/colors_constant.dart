import 'package:flutter/material.dart';

class ColorsConstant {
  static const appWhite = Color(0xFFFFFCF2); //Color(0xFFEDEBEB);

  static Map<int, Color> customColor = {
    50: const Color.fromRGBO(20, 35, 60, .1),
    100: const Color.fromRGBO(20, 35, 60, .2),
    200: const Color.fromRGBO(20, 35, 60, .3),
    300: const Color.fromRGBO(20, 35, 60, .4),
    400: const Color.fromRGBO(20, 35, 60, .5),
    500: const Color.fromRGBO(20, 35, 60, .6),
    600: const Color.fromRGBO(20, 35, 60, .7),
    700: const Color.fromRGBO(20, 35, 60, .8),
    800: const Color.fromRGBO(20, 35, 60, .9),
    900: const Color.fromRGBO(20, 35, 60, 1),
  };

  static MaterialColor mainColorWithSwatch =
      MaterialColor(0xFFFBAFA1, customColor);
}
