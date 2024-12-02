import 'package:flutter/material.dart';

abstract class KColor {
  static const blueDark = Color(0XFF222326);
  static const blueLight = Color(0XFFE7F4F8);
  static const black = Color(0XFF000000);
  static const white = Color(0XFFFFFFFF);
  static const lightGrey = Color(0xFFDADADA);
  static const darkGrey = Color(0xFF222326);
  static const green = Color(0xFF00CA3D);
}

class ColorModel {
  const ColorModel({
    required this.primary,
    required this.background,
    required this.secondary,
    required this.appbar,
    required this.status,
    this.text = KColor.black,
  });

  static const light = ColorModel(
    primary: KColor.blueDark,
    background: KColor.white,
    secondary: KColor.blueLight,
    appbar: KColor.lightGrey,
    status: KColor.green,
  );

  static const dark = ColorModel(
    primary: KColor.blueLight,
    background: KColor.blueDark,
    secondary: KColor.white,
    text: KColor.white,
    appbar: KColor.darkGrey,
    status: KColor.green,
  );

  final Color primary;
  final Color background;
  final Color secondary;
  final Color text;
  final Color appbar;
  final Color status;
}
