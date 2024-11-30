import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/texts.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class RText extends StatelessWidget {
  const RText.title(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.isSelectable = false,
  }) : styleType = TextStyleType.title;

  const RText.subtitle(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.isSelectable = false,
  }) : styleType = TextStyleType.subtitle;

  const RText.text(
    this.text, {
    super.key,
    this.color,
    this.maxLines,
    this.fontWeight,
    this.fontSize,
    this.fontFamily,
    this.align,
    this.textDecoration,
    this.overflow,
    this.fontStyle,
    this.isSelectable = false,
  }) : styleType = TextStyleType.text;

  @override
  Widget build(BuildContext context) {
    TextStyle? getStyle() {
      switch (styleType) {
        case TextStyleType.title:
          return RTheme.of(context).text.title;
        case TextStyleType.subtitle:
          return RTheme.of(context).text.subtitle;
        case TextStyleType.text:
          return RTheme.of(context).text.title;
        default:
          return null;
      }
    }

    final style = getStyle()!.copyWith(
      color: color ?? getStyle()!.color,
      fontWeight: fontWeight ?? getStyle()!.fontWeight,
      fontSize: fontSize ?? getStyle()!.fontSize,
      fontFamily: fontFamily ?? getStyle()!.fontFamily,
      decoration: textDecoration ?? getStyle()!.decoration,
      fontStyle: fontStyle ?? getStyle()!.fontStyle,
    );

    final textAlign = align ?? TextAlign.left;

    return isSelectable
        ? SelectableText(
            text,
            maxLines: maxLines,
            textAlign: textAlign,
            style: style,
          )
        : Text(
            text,
            overflow:
                maxLines != null ? (overflow ?? TextOverflow.ellipsis) : null,
            maxLines: maxLines,
            textAlign: textAlign,
            style: style,
          );
  }

  final String text;
  final TextStyleType styleType;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? align;
  final int? maxLines;
  final TextDecoration? textDecoration;
  final FontStyle? fontStyle;
  final bool isSelectable;
  final TextOverflow? overflow;
}
