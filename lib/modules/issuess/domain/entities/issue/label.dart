import 'dart:ui';

import 'package:flutter_issues_viewer/modules/issuess/data/models/issue/label_data_model.dart';

class Label {
  const Label({
    this.id = -1,
    this.name = '',
    this.color = '',
    this.isColorDark = false,
    this.colorF,
  });

  factory Label.fromData(LabelDataModel label) {
    const base = Label();
    final newColor = label.color ?? base.color;
    final colorF = newColor.isEmpty ? null : Color(int.parse('0xFF$newColor'));
    return Label(
      id: label.id ?? base.id,
      name: label.name ?? base.name,
      color: label.color ?? base.color,
      isColorDark: Label._isColorDark(newColor, colorF),
      colorF: colorF,
    );
  }

  final int id;
  final String name;
  final String color;

  // internal
  final bool isColorDark;
  final Color? colorF;

  static bool _isColorDark(String color, Color? colorF) {
    if (color.isEmpty || colorF == null) {
      return false;
    }
    return (colorF.red * 299 + colorF.green * 587 + colorF.blue * 114) / 1000 <
        128;
  }
}
