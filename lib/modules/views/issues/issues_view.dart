import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

part '_widgets/_issue_item.dart';
part '_widgets/_success.dart';

class IssuesView extends StatelessWidget {
  const IssuesView({super.key});

  @override
  Widget build(BuildContext context) {
    final mmTheme = MMTheme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mmTheme.color.appbar,
        elevation: 0,
        title: const MMText.title('Flutter issues'),
        actions: [
          IconButton(
            icon: Icon(
              mmTheme.theme == AppTheme.light
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
            onPressed: () {
              mmTheme.switchTheme(
                mmTheme.theme == AppTheme.light
                    ? AppTheme.dark
                    : AppTheme.light,
              );
            },
          ),
        ],
      ),
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
