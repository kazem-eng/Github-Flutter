import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/texts.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

class RTheme extends InheritedWidget {
  const RTheme({
    required this.color,
    required this.text,
    required this.theme,
    required super.child,
    super.key,
  });

  final ColorModel color;
  final TextModel text;
  final AppTheme theme;

  static RTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType()!;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;
}
