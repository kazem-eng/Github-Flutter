part of '../issues_view.dart';

class _Success extends StatefulWidget {
  const _Success();

  @override
  State<_Success> createState() => _SuccessState();
}

class _SuccessState extends State<_Success> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final vm = context.read<IssuesViewmodel>();
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
    final vm = context.watch<IssuesViewmodel>();
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
