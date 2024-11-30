part of '../issue_details_view.dart';

class _Success extends StatelessWidget {
  const _Success({
    required this.issue,
  });

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const REmptyHeader(),
      body: Column(
        children: [RText.title(issue.body)],
      ),
    );
  }
}
