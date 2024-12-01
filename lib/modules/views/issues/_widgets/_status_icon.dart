part of '../issues_view.dart';

class _StatusIcon extends StatelessWidget {
  const _StatusIcon();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 40,
      child: CircleAvatar(
        radius: 10,
        backgroundColor: Colors.green,
        child: CircleAvatar(
          radius: 3,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
