import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RSvgPicture extends StatelessWidget {
  const RSvgPicture.asset(
    this.assetName, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  });

  final double? width;
  final double? height;
  final String assetName;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      assetName,
      width: width,
      height: height,
      fit: fit,
    );
  }
}
