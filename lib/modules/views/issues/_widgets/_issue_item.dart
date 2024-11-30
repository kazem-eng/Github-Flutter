part of '../issues_view.dart';

class _IssueItem extends StatelessWidget {
  const _IssueItem(this.issue);

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<IssuesViewmodel>();
    return RippleButton(
      onTap: () => vm.openIssueDetails(issue),
      child: RListItem(
        listItemState: vm.state is BaseStateLoading
            ? RListItemState.loading
            : RListItemState.def,
        padding: const EdgeInsets.all(kSpace2),
        title: '${issue.title} ${issue.number}',
        subtitle: issue.labelsUrl,
        image: issue.user.avatarUrl.isNotEmpty ? issue.user.avatarUrl : null,
        actionWidget: RAvatar(
          title: issue.user.type,
          subtitle: issue.user.id.toString(),
        ),
      ),
    );
  }
}
