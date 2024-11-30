part of '../r_list_item.dart';

class _ListItem extends StatelessWidget {
  const _ListItem({
    required this.actionWidget,
    required this.image,
    required this.title,
    required this.subtitle,
    this.pathType = ImagePathType.network,
    this.padding,
    this.textColor,
  });

  final Widget? actionWidget;
  final String? image;
  final String title;
  final String? subtitle;
  final EdgeInsets? padding;
  final Color? textColor;
  final ImagePathType pathType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: kSpace2,
            horizontal: kSpace1,
          ),
      child: Row(
        children: [
          if (image != null)
            _ListImage(
              imagePath: image!,
              pathType: pathType,
            ),
          _ListBody(
            title: title,
            subtitle: subtitle,
            textColor: textColor,
          ),
          actionWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
