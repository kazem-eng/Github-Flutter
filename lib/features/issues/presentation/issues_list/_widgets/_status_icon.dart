part of '../issues_view.dart';

class _StatusIcon extends StatelessWidget {
  const _StatusIcon();

  @override
  Widget build(BuildContext context) {
    final colors = MMTheme.of(context).color;
    return CircleAvatar(
      radius: 10,
      backgroundColor: colors.status,
      child: CircleAvatar(
        radius: 8,
        backgroundColor: colors.background,
        child: CircleAvatar(
          radius: 3,
          backgroundColor: colors.status,
        ),
      ),
    );
  }
}
