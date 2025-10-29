part of '../issues_view.dart';

class _Success extends ConsumerStatefulWidget {
  const _Success();

  @override
  ConsumerState<_Success> createState() => _SuccessState();
}

class _SuccessState extends ConsumerState<_Success> {
  late final ScrollController _scrollController;
  late final ChangeNotifierProvider<IssuesViewmodel> _provider;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _provider = BaseViewProvider.read<IssuesViewmodel>(context);
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final vm = ref.read(_provider);
    if (_scrollController.position.atEdge) {
      bool isEnd = _scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent;
      if (isEnd) {
        vm.moreIssues();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final vm = ref.watch(_provider);
    final issues = vm.model.issues;
    return _Wrapper(
      child: issues.isEmpty
          ? const Center(child: Text('No issues found'))
          : RefreshIndicator(
              onRefresh: vm.refresh,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: issues.length,
                itemBuilder: (context, index) {
                  return index == issues.length - 1
                      ? Column(
                          children: [
                            _IssueItem(index),
                            const Center(child: MMLoader()),
                          ],
                        )
                      : _IssueItem(index);
                },
              ),
            ),
    );
  }
}
