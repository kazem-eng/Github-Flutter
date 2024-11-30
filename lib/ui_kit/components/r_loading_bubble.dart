import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:shimmer/shimmer.dart';

class MLoadingBubble extends StatelessWidget {
  const MLoadingBubble.withShimmer({
    required this.width,
    this.height = 10,
    this.color,
    this.shape = BoxShape.rectangle,
    this.borderRadius,
    this.margin,
    this.padding,
    super.key,
  }) : hasShimmerEffect = true;
  const MLoadingBubble({
    required this.width,
    this.hasShimmerEffect = false,
    this.height = 10,
    this.color,
    this.borderRadius,
    this.margin,
    this.padding,
    this.shape = BoxShape.rectangle,
    super.key,
  });

  final double height;
  final double width;
  final Color? color;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final BoxShape shape;

  final bool hasShimmerEffect;

  @override
  Widget build(BuildContext context) {
    final defColor = Colors.grey[200]!;
    final child = Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: shape == BoxShape.rectangle
            ? borderRadius ?? BorderRadius.circular(kSpace2)
            : null,
        color: color ?? defColor,
      ),
    );

    return hasShimmerEffect
        ? Shimmer.fromColors(
            baseColor: defColor,
            highlightColor: defColor,
            child: child,
          )
        : child;
  }
}
