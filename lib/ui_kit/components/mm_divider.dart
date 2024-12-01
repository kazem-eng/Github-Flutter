import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';

class MMDivider extends StatelessWidget {
  const MMDivider({
    required Axis orientation,
    required double thickness,
    Color? color,
    double? width,
    double? height,
    super.key,
  })  : _orientation = orientation,
        _thickness = thickness,
        _height = height,
        _width = width,
        _color = color;

  factory MMDivider.horizontal({
    Axis orientation = Axis.horizontal,
    double thickness = defaultThickness,
    double? height,
    Color? color,
  }) {
    return MMDivider(
      orientation: orientation,
      thickness: thickness,
      height: height,
      color: color,
    );
  }

  factory MMDivider.vertical({
    Axis orientation = Axis.vertical,
    double thickness = defaultThickness,
    double? width,
    Color? color,
  }) {
    return MMDivider(
      orientation: orientation,
      thickness: thickness,
      width: width,
      color: color,
    );
  }

  final Axis _orientation;
  final double _thickness;
  final double? _width;
  final double? _height;
  final Color? _color;

  static const defaultThickness = 1.0;

  @override
  Widget build(BuildContext context) {
    final color = _color ?? KColor.black.withOpacity(0.12);
    return _orientation == Axis.horizontal
        ? Divider(
            color: color,
            thickness: _thickness,
            height: _height,
          )
        : VerticalDivider(
            color: color,
            thickness: _thickness,
            width: _width,
          );
  }
}
