part of '../r_list_item.dart';

class _ListItemShimmer extends StatelessWidget {
  const _ListItemShimmer({
    required this.title,
    this.subtitle,
    this.image,
    this.actionWidget,
    this.margin,
  });

  final String title;
  final String? subtitle;
  final String? image;
  final Widget? actionWidget;
  final EdgeInsets? margin;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin ?? const EdgeInsets.all(kSpace1),
      child: Row(
        children: [
          //
          if (image != null)
            const MLoadingBubble.withShimmer(
              width: imageSize,
              height: imageSize,
              margin: EdgeInsets.all(kSpace1),
            ),
          Expanded(
            child: _ListBodyShimmer(
              title: title,
              subtitle: subtitle,
            ),
          ),
        ],
      ),
    );
  }
}

class _ListBodyShimmer extends StatelessWidget {
  const _ListBodyShimmer({
    required this.title,
    this.subtitle,
  });
  final String title;
  final String? subtitle;

  static const titleShimmerHeight = 18.0;
  static const subtitleShimmerHeight = 14.0;

  @override
  Widget build(BuildContext context) {
    const titleWidget = Row(
      children: [
        Expanded(
          child: MLoadingBubble.withShimmer(
            width: double.infinity,
            height: titleShimmerHeight,
            margin: EdgeInsets.all(kSpace1),
          ),
        ),
        Expanded(child: SizedBox()),
      ],
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpace1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          titleWidget,
          if (subtitle != null && subtitle!.isNotEmpty)
            const MLoadingBubble.withShimmer(
              width: double.infinity,
              height: subtitleShimmerHeight,
              margin: EdgeInsets.all(kSpace1),
            ),
        ],
      ),
    );
  }
}
