part of '../issues_view.dart';

class _IssueItem extends ConsumerWidget {
  const _IssueItem(this.issueIndex);

  final int issueIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = BaseViewProvider.of<IssuesViewmodel>(context);
    final vm = ref.watch(provider);
    final color = MMTheme.of(context).color;
    final issue = vm.model.issues[issueIndex];
    final viewed = issue.isViewed ? 'Viewed  \uD83D\uDC40 |' : '';
    final subtitle =
        '$viewed #${issue.number} ${issue.state} by ${issue.user.login}';

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color.background,
        border: Border(
          bottom: BorderSide(color: color.primary, width: 0.15),
        ),
      ),
      child: ListTile(
        onTap: () => ref.read(provider).openIssueDetails(issueIndex),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Issue title
            MMText.title(issue.title),

            // Issue labels
            _IssueLabels(issue: issue),
            KSpacers.vhalf1,

            // Issue subtitle
            MMText.subtitle(subtitle, color: color.subtitle),
          ],
        ),
        minVerticalPadding: 10,
        leading: const _StatusIcon(),
      ),
    );
  }
}
