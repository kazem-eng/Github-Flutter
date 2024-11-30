import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum AssetPackage { root, uiKit }

class MMSvgPicture extends StatelessWidget {
  const MMSvgPicture.asset(
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
