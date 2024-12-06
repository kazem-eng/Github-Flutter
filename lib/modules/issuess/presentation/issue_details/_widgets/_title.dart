part of '../issue_details_view.dart';

class _Title extends StatelessWidget {
  const _Title(
    this.issueNumber,
  );

  final int issueNumber;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.only(right: kSpace1),
          child: FlutterLogo(size: kSpace3),
        ),
        MMText.title('Flutter issues #$issueNumber'),
      ],
    );
  }
}
