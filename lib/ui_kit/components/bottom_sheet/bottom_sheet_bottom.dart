import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';

enum ButtonState {
  initial,
  loading,
  disapbled,
}

class BottomSheetSubmit extends StatelessWidget {
  const BottomSheetSubmit({
    required this.textSubmit,
    required this.submitState,
    required this.onTapSubmit,
    this.submitButtonKey,
    super.key,
  });
  final String textSubmit;
  final ButtonState submitState;
  final VoidCallback? onTapSubmit;

  final Key? submitButtonKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kSpace2),
      child: SafeArea(
        minimum: const EdgeInsets.only(bottom: kSpace2),
        maintainBottomViewPadding: true,
        child: SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: onTapSubmit,
            child: MMText.text(
              textSubmit,
            ),
          ),
        ),
      ),
    );
  }
}
