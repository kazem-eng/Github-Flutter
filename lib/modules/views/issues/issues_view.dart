import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_loader.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:provider/provider.dart';

part '_widgets/_issue_item.dart';
part '_widgets/_success.dart';

class IssuesView extends StatelessWidget {
  const IssuesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const MMText.title('Flutter issues')),
      body: BaseView<IssuesViewmodel>(
        initViewModel: (vm) => vm.initCalendar(),
        builder: (context, vm, _) => vm.state.maybeWhen(
          loading: () => const MMLoader(),
          success: (_) => const _Success(),
          error: (_) => const MMErrorWidget(),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
