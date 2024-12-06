part of '../issue_details_view.dart';

class _Success extends StatelessWidget {
  const _Success();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _Header(),
          _Gap(),
          _User(),
          _Body(),
        ],
      ),
    );
  }
}
