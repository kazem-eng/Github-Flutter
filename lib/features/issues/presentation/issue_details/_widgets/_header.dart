part of '../issue_details_view.dart';

class _Header extends ConsumerWidget {
  const _Header();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mmTheme = MMTheme.of(context);
    final provider = BaseViewProvider.of<IssueDetailsViewmodel>(context);
    final issue = ref.watch(provider).model.issue;

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
