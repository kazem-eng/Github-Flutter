import 'package:flutter/material.dart';

abstract class KColor {
  static const blueDark = Color(0XFF171E31);
  static const blueLight = Color(0XFFE7F4F8);
  static const black = Color(0XFF000000);
  static const white = Color(0XFFFFFFFF);
  static const lightGreen = Color(0XFFA5D6A7);
  static const lightSemiLight = Color(0xFF90CAF9);
}

class ColorModel {
  const ColorModel({
    required this.primary,
    required this.background,
    required this.secondary,
    required this.appbar,
    this.text = KColor.black,
  });

  static const light = ColorModel(
    primary: KColor.blueDark,
    background: KColor.white,
    secondary: KColor.blueLight,
    appbar: KColor.lightGreen,
  );

  static const dark = ColorModel(
    primary: KColor.blueLight,
    background: KColor.blueDark,
    secondary: KColor.white,
    text: KColor.white,
    appbar: KColor.lightSemiLight,
  );

  final Color primary;
  final Color background;
  final Color secondary;
  final Color text;
  final Color appbar;
}
