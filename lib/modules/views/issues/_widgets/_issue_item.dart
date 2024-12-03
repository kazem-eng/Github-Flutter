part of '../issues_view.dart';

class _IssueItem extends StatelessWidget {
  const _IssueItem(this.issueIndex);

  final int issueIndex;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<IssuesViewmodel>();
    final color = MMTheme.of(context).color;
    final issue = vm.model.issues[issueIndex];
    final viewed = issue.isViewed ? 'viewed  \uD83D\uDC40 |' : '';

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
        onTap: () => vm.openIssueDetails(issueIndex),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MMText.title(issue.title),
            _IssueLabels(issue: issue),
            const SizedBox(height: 5),
            MMText.subtitle(
              '$viewed #${issue.number} ${issue.state} by ${issue.user.login}',
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
