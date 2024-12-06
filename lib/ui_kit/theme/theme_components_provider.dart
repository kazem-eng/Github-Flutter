import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/core/services/core_local_storage_service/i_local_core_storage_service.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

class ThemeComponentsProvider extends StatefulWidget {
  const ThemeComponentsProvider({
    required this.builder,
    super.key,
  });

  final Widget Function(
    BuildContext context,
    ThemeData theme,
  ) builder;

  @override
  State<ThemeComponentsProvider> createState() =>
      _ThemeComponentsProviderState();
}

class _ThemeComponentsProviderState extends State<ThemeComponentsProvider> {
  final _localCoreStorageService = locator<ICoreLocalStorageService>();
  AppTheme _currentTheme = AppTheme.light;

  @override
  void initState() {
    _currentTheme =
        _localCoreStorageService.isDarkTheme() ? AppTheme.dark : AppTheme.light;
    super.initState();
  }

  void _switchTheme(AppTheme newTheme) {
    setState(() {
      _currentTheme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors =
        _currentTheme == AppTheme.light ? ColorModel.light : ColorModel.dark;

    return MMTheme(
      color: colors,
      text: getTextsFromColors(colors),
      theme: _currentTheme,
      switchTheme: _switchTheme,
      child: widget.builder(
        context,
        getThemeFromColors(colors),
      ),
    );
  }
}
