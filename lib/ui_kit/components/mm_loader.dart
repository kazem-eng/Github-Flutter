import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';

class MMLoader extends StatelessWidget {
  const MMLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(kSpace2),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
