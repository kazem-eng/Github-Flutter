import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class BottomSheetHandle extends StatelessWidget {
  const BottomSheetHandle({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = MMTheme.of(context).color;
    return Container(
      width: 48,
      height: 4,
      decoration: BoxDecoration(
        color: colors.primary.withOpacity(.3),
        borderRadius: BorderRadius.circular(kSpace2),
      ),
    );
  }
}
