import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/modules/views/events/issues_view.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeComponentsProvider(
      builder: (context, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const IssuesView(),
      ),
    );
  }
}
