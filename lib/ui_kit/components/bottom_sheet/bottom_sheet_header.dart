import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/ui_kit/components/bottom_sheet/bottom_sheet_handle.dart';
import 'package:flutter_issues_viewer/ui_kit/components/bottom_sheet/bottom_sheet_keys.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_divider.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_svg_picture.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';

enum BottomSheetHeaderType {
  child,
  title,
}

class BottomSheetHeader extends StatelessWidget {
  const BottomSheetHeader({
    required this.child,
    this.onClose,
    this.assetPackage = AssetPackage.uiKit,
    this.title,
    this.subtitle,
    this.showHandler = true,
    super.key,
  }) : type = BottomSheetHeaderType.child;

  const BottomSheetHeader.onlyTitle({
    required String this.title,
    this.onClose,
    this.assetPackage = AssetPackage.uiKit,
    this.showHandler = true,
    super.key,
  })  : type = BottomSheetHeaderType.title,
        subtitle = null,
        child = null;

  final Widget? child;
  final VoidCallback? onClose;
  final String? title;
  final String? subtitle;
  final BottomSheetHeaderType type;
  final AssetPackage assetPackage;
  final bool showHandler;

  @override
  Widget build(BuildContext context) {
    Widget buildHeader() {
      Widget header;
      switch (type) {
        case BottomSheetHeaderType.title:
          header = MMText.title(
            title!,
            key: BottomSheetKeys.bottomSheetTitle,
          );
        case BottomSheetHeaderType.child:
        default:
          header = child ?? const SizedBox();
      }
      return Padding(
        padding: const EdgeInsets.only(left: kSpace2),
        child: header,
      );
    }

    Widget closeButton() {
      return Container(
        margin: const EdgeInsets.only(right: kSpace1),
        width: kSpace6,
        height: kSpace6,
        child: CloseButton(
          onPressed: onClose ?? () => Navigator.pop(context),
        ),
      );
    }

    Widget buildBody() {
      return Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: showHandler ? Alignment.centerLeft : Alignment.center,
            child: buildHeader(),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: closeButton(),
          ),
        ],
      );
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: kSpace1),
        if (showHandler) const Center(child: BottomSheetHandle()),
        const SizedBox(height: kSpace1),
        buildBody(),
        MMDivider.horizontal(),
      ],
    );
  }
}
