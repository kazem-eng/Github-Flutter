part of '../issue_details_view.dart';

class _User extends StatelessWidget {
  const _User();

  @override
  Widget build(BuildContext context) {
    final issue = context.watch<IssueDetailsCubit>().model.issue;
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
