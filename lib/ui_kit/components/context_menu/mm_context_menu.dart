import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/components/context_menu/mm_context_menu_item_model.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_text.dart';

class MMContextMenu extends StatelessWidget {
  const MMContextMenu({
    required this.items,
    this.icon,
    this.textColor,
    this.iconColor,
    super.key,
  });

  final List<ContextMenuItem> items;
  final Icon? icon;
  final Color? textColor;
  final Color? iconColor;

  static const _menuItemHorizontalPadding = 18.0;
  static const _menuMargin = 10.0;

  @override
  Widget build(BuildContext context) {
    List<PopupMenuEntry<int>> buildItemList() {
      return items.map((item) {
        final index = items.indexOf(item);
        return PopupMenuItem(
          padding: const EdgeInsets.symmetric(
            horizontal: _menuItemHorizontalPadding,
          ),
          value: index,
          child: MMText.text(item.title, color: textColor),
        );
      }).toList();
    }

    return Padding(
      padding: const EdgeInsets.only(right: _menuMargin),
      child: PopupMenuButton(
        offset: const Offset(0, 40),
        child: icon ?? Icon(Icons.more_vert, color: iconColor),
        itemBuilder: (_) => buildItemList(),
        onSelected: (index) => items[index].onTap(),
      ),
    );
  }
}
