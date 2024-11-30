part of '../r_list_item.dart';

class _ListBody extends StatelessWidget {
  const _ListBody({
    required this.title,
    this.subtitle,
    this.textColor,
  });

  final String title;
  final String? subtitle;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: subtitle != null && subtitle!.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RText.subtitle(
                  title,
                  maxLines: 1,
                ),
                RText.text(subtitle!, color: textColor ?? KColor.blueDark),
              ],
            )
          : RText.subtitle(title, maxLines: 1),
    );
  }
}
