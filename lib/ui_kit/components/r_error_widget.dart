import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/r_text.dart';

class RErrorWidget extends StatelessWidget {
  const RErrorWidget({
    this.errorMessage = _defErr,
    super.key,
  });

  final String errorMessage;

  static const _defErr = 'An error occurred';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RText.subtitle(errorMessage),
    );
  }
}
