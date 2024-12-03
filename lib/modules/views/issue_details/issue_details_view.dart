import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_mvvm/base_view.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_details/issue_details_viewmodel.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/styles_export.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

part '_widgets/_body.dart';
part '_widgets/_gap.dart';
part '_widgets/_header.dart';
part '_widgets/_success.dart';
part '_widgets/_title.dart';
part '_widgets/_user.dart';

class IssueDetailsView extends StatelessWidget {
  const IssueDetailsView({
    required this.props,
    super.key,
  });

  final IssueDetailsProps props;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: _Title(props.issue.number)),
      body: BaseView<IssueDetailsViewmodel>(
        initViewModel: (vm) => vm.initVM(props),
        builder: (context, vm, _) => vm.state.maybeWhen(
          success: (data) => const _Success(),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
