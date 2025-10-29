part of '../issue_details_view.dart';

class _Body extends ConsumerWidget {
  const _Body();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mmTheme = MMTheme.of(context);
    final provider = BaseViewProvider.of<IssueDetailsViewmodel>(context);
    final vm = ref.watch(provider);
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
