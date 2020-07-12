import 'package:flutter/material.dart';
import 'package:whatsapp/utils/color_utils.dart';
import 'package:whatsapp/views/pages/main_page.dart';

void main() {
  runApp(Whatsapp());
}

class Whatsapp extends StatelessWidget {
  final MaterialColor _mainColor =
      ColorUtils.generateMaterialColor(18, 140, 126, 0xFF128C7E);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: _mainColor,
      ),
      home: MainPage(),
    );
  }
}
