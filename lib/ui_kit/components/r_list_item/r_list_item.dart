import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/r_loading_bubble.dart';
import 'package:flutter_issues_viewer/ui_kit/components/r_svg_picture.dart';
import 'package:flutter_issues_viewer/ui_kit/components/r_text.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/colors.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

part 'inner_widgets/_body.dart';
part 'inner_widgets/_image.dart';
part 'inner_widgets/_item.dart';
part 'inner_widgets/_shimmer.dart';

enum RListItemState {
  loading,
  def,
}

enum ImagePathType {
  local,
  network,
  empty,
}

const imageSize = 40.0;
const iconSize = 24.0;

class RListItem extends StatelessWidget {
  const RListItem({
    required this.title,
    this.listItemState = RListItemState.def,
    this.pathType = ImagePathType.network,
    this.subtitle,
    this.image,
    this.actionWidget,
    this.padding,
    this.textColor,
    super.key,
  });

  final String title;
  final String? subtitle;
  final String? image;
  final Widget? actionWidget;
  final RListItemState listItemState;
  final EdgeInsets? padding;
  final Color? textColor;
  final ImagePathType pathType;

  @override
  Widget build(BuildContext context) {
    return listItemState == RListItemState.loading
        ? _ListItemShimmer(
            title: title,
            subtitle: subtitle,
            actionWidget: actionWidget,
            image: image,
            margin: padding,
          )
        : _ListItem(
            actionWidget: actionWidget,
            image: image,
            title: title,
            subtitle: subtitle,
            padding: padding,
            textColor: textColor,
            pathType: pathType,
          );
  }
}
