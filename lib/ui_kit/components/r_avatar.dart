import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/r_text.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class RAvatar extends StatelessWidget {
  const RAvatar({
    required this.title,
    required this.subtitle,
    super.key,
  });

  final String title;
  final String subtitle;

  static const double _avatarSize = 54.0;

  @override
  Widget build(BuildContext context) {
    final color = RTheme.of(context).color;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: kSpace1),
      width: _avatarSize,
      height: _avatarSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color.secondary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: RText.subtitle(title)),
          Flexible(child: RText.title(subtitle)),
        ],
      ),
    );
  }
}
