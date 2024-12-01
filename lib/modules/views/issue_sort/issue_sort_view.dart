import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_mvvm/base_view.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_viewmodel.dart';
import 'package:flutter_issues_viewer/ui_kit/components/bottom_sheet/bottom_sheet_export.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_components_export.dart';
import 'package:flutter_issues_viewer/ui_kit/theme/theme.dart';

class IssueSortView extends StatelessWidget {
  const IssueSortView({
    required this.props,
    super.key,
  });

  final IssueSortProps props;

  @override
  Widget build(BuildContext context) {
    final color = MMTheme.of(context).color;
    return BottomSheetWrapper(
      header: const BottomSheetHeader.onlyTitle(title: 'Filter'),
      body: BaseView<IssueSortViewmodel>(
        initViewModel: (vm) => vm.initVM(props),
        builder: (context, vm, _) => vm.state.maybeWhen(
          success: (data) => ListView.builder(
            shrinkWrap: true,
            itemCount: IssuesSortBy.values.length,
            itemBuilder: (context, index) {
              final sort = IssuesSortBy.values[index];
              return ListTile(
                title: MMText.title(
                  sort.name,
                  color: color.primary,
                ),
                onTap: () => vm.onSortChanged(sort),
                trailing: data.selectedSort == sort
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_unchecked),
              );
            },
          ),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
