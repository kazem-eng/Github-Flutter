import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/setup/locator.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issuess/views/issues/issues_view.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = locator<NavigationService>().navigatorKey;
    return ThemeComponentsProvider(
      builder: (_, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: onGenerateRoute,
        theme: theme,
        home: const IssuesView(),
      ),
    );
  }
}
