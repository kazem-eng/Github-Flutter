import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_text.dart';

class MMErrorWidget extends StatelessWidget {
  const MMErrorWidget({
    this.errorMessage = _defErr,
    super.key,
  });

  final String errorMessage;

  static const _defErr = 'An error occurred';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MMText.subtitle(errorMessage),
    );
  }
}
