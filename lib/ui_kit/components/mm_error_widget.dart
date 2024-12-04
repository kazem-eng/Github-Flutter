import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/core/domain/base/base_exception.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_text.dart';

class MMErrorWidget extends StatelessWidget {
  const MMErrorWidget(this.exception, {super.key});

  final BaseException? exception;

  static final _defErr = BaseException(
    prefix: 'Error',
    message: 'Something went wrong...',
  );
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MMText.subtitle(
        exception != null ? exception.toString() : _defErr.toString(),
        align: TextAlign.center,
      ),
    );
  }
}
