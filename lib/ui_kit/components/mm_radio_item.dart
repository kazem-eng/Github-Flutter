import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_text.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class MMRadioItem extends StatelessWidget {
  const MMRadioItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = MMTheme.of(context).color;
    return ListTile(
      title: MMText.title(text, color: color.primary),
      onTap: onTap,
      trailing: Icon(
        isSelected ? Icons.radio_button_checked : Icons.radio_button_unchecked,
        color: color.secondary,
      ),
    );
  }
}
