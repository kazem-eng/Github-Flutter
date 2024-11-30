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
    ),
    title: base.copyWith(
      fontSize: 14,
      fontWeight: FontWeight.w600,
    ),
    subtitle: base.copyWith(
      fontSize: 12,
      fontWeight: FontWeight.w400,
    ),
  );
}

ThemeData getThemeFromColors(ColorModel mmColors) {
  return ThemeData(
    primaryColor: mmColors.primary,
    canvasColor: mmColors.background,
    scaffoldBackgroundColor: mmColors.background,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.grey[300],
    ),
    useMaterial3: false,
  );
}
