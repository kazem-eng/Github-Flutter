import 'package:flutter/material.dart';

enum TextStyleType {
  title,
  subtitle,
  text,
  menu,
}

class TextModel {
  const TextModel({
    required this.title,
    required this.subtitle,
    required this.text,
  });

  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
}
