import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/texts.dart';

enum AppTheme { dark, light }

TextModel getTextsFromColors(ColorModel colors) {
  final base = TextStyle(
    color: colors.text,
    decoration: TextDecoration.none,
  );

  return TextModel(
    text: base.copyWith(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      color: colors.text,
    ),
    title: base.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: colors.text,
    ),
    subtitle: base.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: colors.text,
    ),
  );
}

ThemeData getThemeFromColors(ColorModel mmColors) {
  return ThemeData(
    primaryColor: mmColors.primary,
    canvasColor: mmColors.background,
    scaffoldBackgroundColor: mmColors.background,
    appBarTheme: AppBarTheme(
      backgroundColor: mmColors.appbar,
      elevation: 0,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: mmColors.background,
      shadowColor: mmColors.background,
    ),
    useMaterial3: false,
  );
}
