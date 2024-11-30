part of '../r_list_item.dart';

class _ListImage extends StatelessWidget {
  const _ListImage({
    required this.imagePath,
    this.pathType = ImagePathType.network,
  });

  final String imagePath;
  final ImagePathType pathType;

  @override
  Widget build(BuildContext context) {
    final colors = RTheme.of(context).color;
    return Container(
      padding:
          const EdgeInsets.only(right: kSpace1, top: kSpace1, bottom: kSpace1),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(kSpace2),
        ),
        child: SizedBox.square(
          dimension: imageSize,
          child: switch (pathType) {
            ImagePathType.local => RSvgPicture.asset(
                imagePath,
              ),
            ImagePathType.network => CachedNetworkImage(
                imageUrl: imagePath,
                fit: BoxFit.cover,
                width: imageSize,
                height: imageSize,
              ),
            ImagePathType.empty => Container(
                color: colors.background,
              ),
          },
        ),
      ),
    );
  }
}
