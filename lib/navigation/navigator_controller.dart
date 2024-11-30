import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/navigation/routes.dart';

class NavigatorController {
  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  Future<dynamic> goTo(
    String routeName, {
    dynamic arguments,
    bool logRoute = true,
  }) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  void goBack([dynamic arguments]) {
    return navigatorKey.currentState!.pop(arguments);
  }

  Future<void> loaderScreen({
    required bool show,
  }) async {
    show
        ? goTo(
            Routes.loaderScreen,
            logRoute: false,
          )
        : goBack();
  }
}
