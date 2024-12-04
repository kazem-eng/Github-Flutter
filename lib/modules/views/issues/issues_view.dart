import 'package:flutter/material.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/spacers.dart';
import 'package:provider/provider.dart';

import 'package:flutter_issues_viewer/core/domain/base/base.dart';
import 'package:flutter_issues_viewer/core/domain/helpers/bottom_sheet_helper.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/domain/entities/issue/issue.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_view.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_view.dart';
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/navigation/routes.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

part '_widgets/_issue_item.dart';
part '_widgets/_issue_label.dart';
part '_widgets/_status_icon.dart';
part '_widgets/_success.dart';
part '_widgets/_wrapper.dart';

class IssuesView extends StatefulWidget {
  const IssuesView({super.key});

  @override
  State<IssuesView> createState() => _IssuesViewState();
}

class _IssuesViewState extends State<IssuesView> {
  void themeInitializer({required bool isDark}) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MMTheme.of(context).switchTheme(
        isDark ? AppTheme.light : AppTheme.dark,
      );
    });
  }

  Future<IssuesFilterBy?> filterBottomSheet(
    IssueFilterProps props,
  ) async {
    return await BottomSheetHelper.showBottomSheet(
      context: context,
      widget: IssueFilterView(props: props),
      routeName: BottomSheetRoutes.issueFilter,
    ) as IssuesFilterBy?;
  }

  Future<IssuesSortBy?> sortBottomSheet(
    IssueSortProps props,
  ) async {
    return await BottomSheetHelper.showBottomSheet(
      context: context,
      widget: IssueSortView(props: props),
      routeName: BottomSheetRoutes.issueSort,
    ) as IssuesSortBy?;
  }

  @override
  Widget build(BuildContext context) {
    return BaseView<IssuesViewmodel>(
      initViewModel: (vm) => vm.initCalendar(
        filterBottomSheet: filterBottomSheet,
        sortBottomSheet: sortBottomSheet,
        themeInitializer: themeInitializer,
      ),
      builder: (context, vm, _) => vm.state.maybeWhen(
        loading: () => const _Wrapper(child: MMLoader()),
        success: (_) => const _Success(),
        error: (_, exception) => _Wrapper(
          child: MMErrorWidget(exception),
        ),
        orElse: () => const SizedBox(),
      ),
    );
  }
}
