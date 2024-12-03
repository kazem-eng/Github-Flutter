import 'package:flutter/material.dart';

abstract class KColor {
  static const blueDark = Color(0XFF222326);
  static const blueLight = Color(0XFFE7F4F8);
  static const black = Color(0XFF000000);
  static const white = Color(0XFFFFFFFF);
  static const semiLightGrey = Color(0xFFDADADA);
  static const darkGrey = Color(0xFF222326);
  static const green = Color(0xFF00CA3D);
  static const blue = Color(0xFF4389CF);
  static const greyShade1 = Color(0xFFF5F5F5);
  static const greyShade2 = Color(0xFFE0E0E0);
  static const greyShade8 = Color(0xFF424242);
  static const greyShade6 = Color(0xFF757575);
}

class ColorModel {
  const ColorModel({
    required this.primary,
    required this.background,
    required this.secondary,
    required this.appbar,
    required this.status,
    required this.gap,
    required this.contentBg,
    required this.text,
    required this.subtitle,
  });

  static const light = ColorModel(
    text: KColor.black,
    primary: KColor.blueDark,
    background: KColor.white,
    secondary: KColor.blue,
    appbar: KColor.semiLightGrey,
    status: KColor.green,
    gap: KColor.greyShade2,
    contentBg: KColor.greyShade1,
    subtitle: KColor.greyShade6,
  );

  static const dark = ColorModel(
    primary: KColor.blueLight,
    background: KColor.blueDark,
    secondary: KColor.blue,
    text: KColor.white,
    appbar: KColor.darkGrey,
    status: KColor.green,
    gap: KColor.greyShade8,
    contentBg: KColor.greyShade8,
    subtitle: KColor.greyShade6,
  );

  final Color primary;
  final Color background;
  final Color secondary;
  final Color text;
  final Color subtitle;
  final Color appbar;
  final Color status;
  final Color gap;
  final Color contentBg;
}
