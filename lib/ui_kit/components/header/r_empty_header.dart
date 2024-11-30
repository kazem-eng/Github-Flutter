import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class REmptyHeader extends PreferredSize {
  const REmptyHeader({
    super.key,
    this.color,
  }) : super(
          child: const SizedBox(),
          preferredSize: const Size(0, 0),
        );

  final Color? color;

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: color ?? RTheme.of(context).color.secondary,
    );
  }
}
