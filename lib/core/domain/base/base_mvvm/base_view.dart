import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_issues_viewer/core/domain/base/base_mvvm/base_viewmodel.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  const BaseView({
    required this.builder,
    this.initViewModel,
    this.notRebuild,
    this.onDispose,
    this.disposeVM = true,
    super.key,
  });

  final Widget Function(
    BuildContext context,
    T viewModel,
    Widget? child,
  ) builder;

  final Function(T viewModel)? initViewModel;
  final Function(T viewModel)? onDispose;
  final bool disposeVM;
  final Widget? notRebuild;

  @override
  State<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  final T viewModel = locator<T>();

  @override
  void initState() {
    super.initState();
    if (!viewModel.initialised) {
      widget.initViewModel?.call(viewModel);
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.disposeVM) {
      return ChangeNotifierProvider.value(
        value: viewModel,
        child: Consumer(
          builder: widget.builder,
          child: widget.notRebuild,
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (_) => viewModel,
      child: Consumer(
        builder: widget.builder,
        child: widget.notRebuild,
      ),
    );
  }
}
