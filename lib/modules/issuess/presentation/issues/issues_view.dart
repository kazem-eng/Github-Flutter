import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_issues_viewer/core/base/base.dart';
import 'package:flutter_issues_viewer/core/helpers/bottom_sheet_helper.dart';
import 'package:flutter_issues_viewer/core/services/core_services_export.dart';
import 'package:flutter_issues_viewer/modules/issuess/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/issuess/domain/entities/issue/issue.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_filter/issue_filter_view.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issue_sort/issue_sort_view.dart';
import 'package:flutter_issues_viewer/modules/issuess/presentation/issues/issues_viewmodel.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/constants.dart';
import 'package:flutter_issues_viewer/ui_kit/styles/spacers.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme_components_contracts.dart';

part '_widgets/_issue_item.dart';
part '_widgets/_issue_label.dart';
part '_widgets/_status_icon.dart';
part '_widgets/_success.dart';
part '_widgets/_wrapper.dart';

class IssuesView extends StatelessWidget {
  const IssuesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<IssuesViewmodel>(
      initViewModel: (vm) {
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

        return vm.initCalendar(
          filterBottomSheet: filterBottomSheet,
          sortBottomSheet: sortBottomSheet,
        );
      },
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
