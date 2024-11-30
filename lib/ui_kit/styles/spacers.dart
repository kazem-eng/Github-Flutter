import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';

abstract class KSpacers {
  static const vhalf1 = SizedBox(height: kSpaceHalf1);
  static const v1 = SizedBox(height: kSpace1);
  static const v2 = SizedBox(height: kSpace2);
  static const v3 = SizedBox(height: kSpace3);
  static const v4 = SizedBox(height: kSpace4);
  static const v5 = SizedBox(height: kSpace5);
  static const v6 = SizedBox(height: kSpace6);
  static const v7 = SizedBox(height: kSpace7);
  static const v8 = SizedBox(height: kSpace8);
  static const hhalf1 = SizedBox(width: kSpaceHalf1);
  static const h1 = SizedBox(width: kSpace1);
  static const h2 = SizedBox(width: kSpace2);
  static const h3 = SizedBox(width: kSpace3);
  static const h4 = SizedBox(width: kSpace4);
  static const h5 = SizedBox(width: kSpace5);
  static const h6 = SizedBox(width: kSpace6);
  static const h7 = SizedBox(width: kSpace7);
  static const h8 = SizedBox(width: kSpace8);
}

class SpacerBottom extends StatelessWidget {
  const SpacerBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: screenInsetsBottom(context));
  }
}

class SpacerTop extends StatelessWidget {
  const SpacerTop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: screenInsetsTop(context));
  }
}

double screenInsetsTop(BuildContext context) {
  return MediaQuery.of(context).padding.top;
}

double screenInsetsBottom(BuildContext context) {
  return MediaQuery.of(context).padding.bottom;
}
