import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/core/base/base_mvvm/base_view.dart';
import 'package:flutter_issues_viewer/features/issues/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_props.dart';
import 'package:flutter_issues_viewer/features/issues/presentation/issue_sort/issue_sort_cubit.dart';
import 'package:flutter_issues_viewer/ui_kit/components/bottom_sheet/bottom_sheet_export.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_radio_item.dart';

class IssueSortView extends StatelessWidget {
  const IssueSortView({
    required this.props,
    super.key,
  });

  final IssueSortProps props;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      header: const BottomSheetHeader.onlyTitle(title: 'Sort by'),
      body: BaseView<IssueSortCubit>(
        initViewModel: (vm) => vm.initVM(props),
        builder: (context, vm, _) => vm.state.maybeWhen(
          success: (data) => ListView.builder(
            shrinkWrap: true,
            itemCount: IssuesSortBy.values.length,
            itemBuilder: (context, index) {
              final sort = IssuesSortBy.values[index];
              return MMRadioItem(
                text: sort.name,
                isSelected: data.selectedSort == sort,
                onTap: () => vm.onSortChanged(sort),
              );
            },
          ),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
