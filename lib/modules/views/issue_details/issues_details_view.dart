import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_mvvm/base_view.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issues_details_props.dart';
import 'package:flutter_issues_viewer/ui_kit/components/m_components_export.dart';

part '_widgets/_success.dart';

class IssuesDetailsView extends StatelessWidget {
  const IssuesDetailsView({
    required this.props,
    super.key,
  });

  final IssueDetailsProps props;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const REmptyHeader(),
      body: BaseView<IssueDetailsViewmodel>(
        initViewModel: (vm) => vm.initCalendar(props),
        builder: (context, vm, _) => vm.state.maybeWhen(
          success: (data) => _Success(issue: data.issue),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
