import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/texts.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

class MMTheme extends InheritedWidget {
  const MMTheme({
    required this.color,
    required this.text,
    required this.theme,
    required this.switchTheme,
    required super.child,
    super.key,
  });

  final ColorModel color;
  final TextModel text;
  final AppTheme theme;
  final void Function(AppTheme newTheme) switchTheme;
  static MMTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
