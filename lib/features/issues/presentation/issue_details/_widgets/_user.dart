part of '../issue_details_view.dart';

class _User extends ConsumerWidget {
  const _User();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = BaseViewProvider.of<IssueDetailsViewmodel>(context);
    final issue = ref.watch(provider).model.issue;
    return ListTile(
      leading: CircleAvatar(
        radius: kSpace3,
        backgroundImage: NetworkImage(issue.user.avatarUrl),
      ),
      title: MMText.text(issue.user.login),
      subtitle: MMText.text(issue.user.type),
    );
  }
}
