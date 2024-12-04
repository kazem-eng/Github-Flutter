part of '../issue_details_view.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final mmTheme = MMTheme.of(context);
    final issue = context.watch<IssueDetailsViewmodel>().model.issue;

    return Padding(
      padding: const EdgeInsets.all(kSpace2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MMText.title(issue.title),
          KSpacers.v1,
          Chip(
            label: MMText.text(issue.state),
            backgroundColor: mmTheme.color.status,
          ),
        ],
      ),
    );
  }
}
