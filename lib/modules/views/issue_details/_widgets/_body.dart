part of '../issue_details_view.dart';

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    final mmTheme = MMTheme.of(context);
    final vm = context.watch<IssueDetailsViewmodel>();
    return Flexible(
      child: Container(
        margin: const EdgeInsets.all(kSpace2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(kSpace2),
          color: mmTheme.color.contentBg,
        ),
        padding: const EdgeInsets.all(kSpace2),
        child: MMText.text(vm.model.issue.body),
      ),
    );
  }
}
