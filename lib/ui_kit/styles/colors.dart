import 'package:flutter/material.dart';

abstract class KColor {
  static const blueDark = Color(0XFF171E31);
  static const blueLight = Color(0XFFE7F4F8);
  static const black = Color(0XFF000000);
  static const white = Color(0XFFFFFFFF);
  static const grey = Color(0XFFF3F3F3);
}

class ColorModel {
  const ColorModel({
    required this.primary,
    required this.background,
    required this.secondary,
    this.text = KColor.black,
  });

  ColorModel.defaultColors()
      : primary = KColor.blueDark,
        background = KColor.blueLight,
        text = KColor.black,
        secondary = KColor.grey;

  final Color primary;
  final Color background;
  final Color secondary;
  final Color text;
}
