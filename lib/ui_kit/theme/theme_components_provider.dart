import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

class ThemeComponentsProvider extends StatelessWidget {
  const ThemeComponentsProvider({
    required this.builder,
    super.key,
  });

  final Widget Function(
    BuildContext context,
    ThemeData theme,
  ) builder;

  @override
  Widget build(BuildContext context) {
    final colors = ColorModel.defaultColors();
    final text = getTextsFromColors(colors);

    return RTheme(
      color: colors,
      text: text,
      theme: AppTheme.light,
      child: builder(
        context,
        getThemeFromColors(colors),
      ),
    );
  }
}
