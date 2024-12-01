import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_mvvm/base_view.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_props.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';

class IssueDetailsView extends StatelessWidget {
  const IssueDetailsView({
    required this.props,
    super.key,
  });

  final IssueDetailsProps props;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MMText.title(
          'Flutter issues #${props.issue.number}',
        ),
      ),
      body: BaseView<IssueDetailsViewmodel>(
        initViewModel: (vm) => vm.initVM(props),
        builder: (context, vm, _) => vm.state.maybeWhen(
          success: (data) => MMText.title(data.issue.body),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
