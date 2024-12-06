part of '../issue_details_view.dart';

class _Gap extends StatelessWidget {
  const _Gap();

  @override
  Widget build(BuildContext context) {
    final mmTheme = MMTheme.of(context);
    return Container(
      height: kSpace2,
      width: double.infinity,
      color: mmTheme.color.gap,
    );
  }
}
