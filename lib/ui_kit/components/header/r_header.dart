import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class RHeader extends StatelessWidget {
  const RHeader({
    this.height = 44,
    super.key,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final color = RTheme.of(context).color.primary;
    return Container(
      color: color,
      height: height,
      alignment: Alignment.center,
      child: Container(
        color: Colors.red,
      ),
    );
  }
}
