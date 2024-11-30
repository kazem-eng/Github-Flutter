import 'package:flutter/material.dart';

class RippleButton extends StatelessWidget {
  const RippleButton({
    required this.child,
    this.borderRadius,
    this.onLongPress,
    this.onTap,
    this.color = Colors.transparent,
    this.isDisabled = false,
    this.splashColor,
    this.onTapDown,
    this.margin,
    super.key,
  });

  final Widget child;
  final Color color;
  final Color? splashColor;
  final bool isDisabled;
  final BorderRadius? borderRadius;
  final void Function()? onTap;
  final void Function()? onLongPress;
  final void Function(TapDownDetails)? onTapDown;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    final button = isDisabled
        ? DecoratedBox(
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius,
            ),
            child: child,
          )
        : Material(
            color: color,
            child: InkWell(
              onTap: onTap,
              onLongPress: onLongPress,
              onTapDown: onTapDown,
              splashColor: splashColor,
              borderRadius: borderRadius,
              child: child,
            ),
          );
    return margin != null
        ? Padding(
            padding: margin!,
            child: button,
          )
        : button;
  }
}
