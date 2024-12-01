import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

const bottomSheetWrapperHorizontalPadding = kSpace2;
const bottomSheetMaxHeightRatio = .85;

double bottomSheetMaxHeight(BuildContext context) {
  return MediaQuery.sizeOf(context).height * bottomSheetMaxHeightRatio;
}

class BottomSheetWrapper extends StatelessWidget {
  const BottomSheetWrapper({
    required this.body,
    required this.header,
    this.height,
    this.backgroundColor,
    this.withHorizontalPadding = true,
    this.onDismiss,
    super.key,
  });

  final Widget body;
  final Widget header;
  final double? height;
  final Color? backgroundColor;
  final bool withHorizontalPadding;
  final VoidCallback? onDismiss;

  static const _shadow = BoxShadow(
    offset: Offset(0.0, 8.0),
    blurRadius: 16.0,
  );

  @override
  Widget build(BuildContext context) {
    const cornerRadius = Radius.circular(12);
    final color = MMTheme.of(context).color;

    Widget getChild() {
      final childWithPadding = Padding(
        padding: EdgeInsets.only(
          left: withHorizontalPadding ? bottomSheetWrapperHorizontalPadding : 0,
          right:
              withHorizontalPadding ? bottomSheetWrapperHorizontalPadding : 0,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: body,
      );
      if (height == null) {
        return Flexible(child: childWithPadding);
      }
      return Expanded(child: childWithPadding);
    }

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          onDismiss?.call();
        }
      },
      child: Container(
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ?? color.background,
          borderRadius: const BorderRadius.only(
            topLeft: cornerRadius,
            topRight: cornerRadius,
          ),
          boxShadow: const [_shadow],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            header,
            getChild(),
          ],
        ),
      ),
    );
  }
}
