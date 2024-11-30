import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issues_details_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issues_details_view.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_view.dart';
import 'package:flutter_issues_viewer/navigation/routes.dart';

Route _cupertino(Widget route) {
  return CupertinoPageRoute(builder: (_) => route);
}

Route _showUp(Widget route) {
  return PageRouteBuilder(pageBuilder: (_, __, ___) => route);
}

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.issues:
      return _cupertino(const IssuesView());

    case Routes.issueDetail:
      final props = settings.arguments as IssueDetailsProps;
      return _cupertino(IssuesDetailsView(props: props));

    default:
      return _showUp(_NotFoundRoute(settings.name));
  }
}

class _NotFoundRoute extends StatelessWidget {
  const _NotFoundRoute(this.route);

  final String? route;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Not Found ${route ?? ''}'),
      ),
    );
  }
}
