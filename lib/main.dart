import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/app.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const App());
}
