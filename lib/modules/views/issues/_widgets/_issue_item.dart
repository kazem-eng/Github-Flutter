part of '../issues_view.dart';

class _IssueItem extends StatelessWidget {
  const _IssueItem(this.issue);

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<IssuesViewmodel>();

    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: ListTile(
        onTap: () => vm.openIssueDetails(issue),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Wrap(
              children: [
                RText.title(issue.title),
                if (issue.labels.isNotEmpty)
                  ...issue.labels.map(
                    (label) {
                      final bgColor = Color(int.parse('0xFF${label.color}'));

                      return SizedBox(
                        height: 40,
                        child: FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.only(right: kSpace1),
                            child: Chip(
                              label: RText.subtitle(
                                label.name,
                                color: bgColor.computeLuminance() < .5
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              backgroundColor: bgColor,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
              ],
            ),
            const SizedBox(height: 5),
            RText.subtitle(
              '#${issue.number} ${issue.state} by ${issue.user.login}',
              color: Colors.grey[600],
            ),
          ],
        ),
        minVerticalPadding: 10,
        leading: SizedBox(
          width: 40,
          child: Align(
            child: CircleAvatar(
              radius: 10,
              backgroundImage: NetworkImage(issue.user.avatarUrl),
              backgroundColor: Colors.green,
              child: const CircleAvatar(
                radius: 3,
                backgroundColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
