import 'package:flutter/material.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_mvvm/base_view.dart';
import 'package:flutter_issues_viewer/modules/data/models/issue_contracts.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_props.dart';
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_viewmodel.dart';
import 'package:flutter_issues_viewer/ui_kit/components/bottom_sheet/bottom_sheet_export.dart';
import 'package:flutter_issues_viewer/ui_kit/components/mm_radio_item.dart';

class IssueFilterView extends StatelessWidget {
  const IssueFilterView({
    required this.props,
    super.key,
  });

  final IssueFilterProps props;

  @override
  Widget build(BuildContext context) {
    return BottomSheetWrapper(
      header: const BottomSheetHeader.onlyTitle(title: 'Filter'),
      body: BaseView<IssueFilterViewmodel>(
        initViewModel: (vm) => vm.initVM(props),
        builder: (context, vm, _) => vm.state.maybeWhen(
          success: (data) => ListView.builder(
            shrinkWrap: true,
            itemCount: IssuesFilterBy.values.length,
            itemBuilder: (context, index) {
              final filter = IssuesFilterBy.values[index];
              return MMRadioItem(
                text: filter.name,
                isSelected: filter == data.selectedFilter,
                onTap: () => vm.onFilterChanged(filter),
              );
            },
          ),
          orElse: () => const SizedBox(),
        ),
      ),
    );
  }
}
