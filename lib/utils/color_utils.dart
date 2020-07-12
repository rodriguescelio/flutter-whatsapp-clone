import 'package:flutter/material.dart';

class ColorUtils {
  static MaterialColor generateMaterialColor(int r, g, b, hexa) {
    List<int> indexes = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    Map<int, Color> color = {};

    for (int i = 0; i < 10; i++) {
      double opacity = ((i + 1) / 10);
      color[indexes[i]] = Color.fromRGBO(r, g, b, opacity);
    }

    return MaterialColor(hexa, color);
  }
}
