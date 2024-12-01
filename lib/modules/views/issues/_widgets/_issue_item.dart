part of '../issues_view.dart';

class _IssueItem extends StatelessWidget {
  const _IssueItem(this.issue);

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<IssuesViewmodel>();
    final color = MMTheme.of(context).color;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.background,
        border: Border(
          bottom: BorderSide(
            color: color.primary,
            width: 0.15,
          ),
        ),
      ),
      child: ListTile(
        onTap: () => vm.openIssueDetails(issue),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _IssueLabels(issue: issue),
            const SizedBox(height: 5),
            // subtitle
            MMText.subtitle(
              '#${issue.number} ${issue.state} by ${issue.user.login}',
              color: Colors.grey[600],
            ),
          ],
        ),
        minVerticalPadding: 10,
        leading: const _StatusIcon(),
      ),
    );
  }
}
