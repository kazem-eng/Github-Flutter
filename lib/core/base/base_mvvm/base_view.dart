import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_issues_viewer/core/base/base_mvvm/base_cubit.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class BaseView<T extends BaseCubit> extends StatefulWidget {
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

class _BaseViewState<T extends BaseCubit> extends State<BaseView<T>> {
  late final T viewModel = locator<T>();

  @override
  void initState() {
    super.initState();
    if (!viewModel.initialised) {
      widget.initViewModel?.call(viewModel);
      viewModel.setInitialized = true;
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose?.call(viewModel);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildChild() => Builder(
          builder: (context) {
            final vm = context.watch<T>();
            return widget.builder(context, vm, widget.notRebuild);
          },
        );

    if (!widget.disposeVM) {
      return BlocProvider<T>.value(
        value: viewModel,
        child: buildChild(),
      );
    }

    return BlocProvider<T>(
      create: (_) => viewModel,
      child: buildChild(),
    );
  }
}
