import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_issues_viewer/core/base/base_mvvm/base_viewmodel.dart';
import 'package:flutter_issues_viewer/setup/locator.dart';

class BaseView<T extends BaseViewModel> extends ConsumerStatefulWidget {
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
  ConsumerState<BaseView<T>> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel>
    extends ConsumerState<BaseView<T>> {
  late final T viewModel;
  late final ChangeNotifierProvider<T> _provider;

  @override
  void initState() {
    super.initState();
    viewModel = locator<T>();
    _provider = ChangeNotifierProvider<T>.value(value: viewModel);
    if (!viewModel.initialised) {
      widget.initViewModel?.call(viewModel);
    }
  }

  @override
  void dispose() {
    widget.onDispose?.call(viewModel);
    if (widget.disposeVM) {
      viewModel.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _BaseViewScope<T>(
      provider: _provider,
      child: Consumer(
        builder: (context, ref, child) => widget.builder(
          context,
          ref.watch(_provider),
          child,
        ),
        child: widget.notRebuild,
      ),
    );
  }
}

class BaseViewProvider {
  const BaseViewProvider._();

  static ChangeNotifierProvider<T> of<T extends BaseViewModel>(
    BuildContext context,
  ) {
    final scope =
        context.dependOnInheritedWidgetOfExactType<_BaseViewScope<T>>();
    assert(scope != null, 'No BaseView provider found for type $T');
    return scope!.provider;
  }

  static ChangeNotifierProvider<T> read<T extends BaseViewModel>(
    BuildContext context,
  ) {
    final element = context
        .getElementForInheritedWidgetOfExactType<_BaseViewScope<T>>();
    assert(element != null, 'No BaseView provider found for type $T');
    return (element!.widget as _BaseViewScope<T>).provider;
  }
}

class _BaseViewScope<T extends BaseViewModel> extends InheritedWidget {
  const _BaseViewScope({
    required this.provider,
    required super.child,
  });

  final ChangeNotifierProvider<T> provider;

  @override
  bool updateShouldNotify(covariant _BaseViewScope<T> oldWidget) => false;
}
