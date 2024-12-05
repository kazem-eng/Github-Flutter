// Mocks generated by Mockito 5.4.4 from annotations
// in flutter_issues_viewer/test/modules/issues/issues/issue_view_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:ui' as _i8;

import 'package:flutter_issues_viewer/core/domain/base/base.dart' as _i3;
import 'package:flutter_issues_viewer/modules/views/issue_filter/issue_filter_callback.dart'
    as _i6;
import 'package:flutter_issues_viewer/modules/views/issue_sort/issue_sort_callback.dart'
    as _i7;
import 'package:flutter_issues_viewer/modules/views/issues/issues_model.dart'
    as _i2;
import 'package:flutter_issues_viewer/modules/views/issues/issues_viewmodel.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeIssuesModel_0 extends _i1.SmartFake implements _i2.IssuesModel {
  _FakeIssuesModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeBaseState_1<Data> extends _i1.SmartFake
    implements _i3.BaseState<Data> {
  _FakeBaseState_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [IssuesViewmodel].
///
/// See the documentation for Mockito's code generation for more information.
class MockIssuesViewmodel extends _i1.Mock implements _i4.IssuesViewmodel {
  MockIssuesViewmodel() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IssuesModel get model => (super.noSuchMethod(
        Invocation.getter(#model),
        returnValue: _FakeIssuesModel_0(
          this,
          Invocation.getter(#model),
        ),
      ) as _i2.IssuesModel);

  @override
  _i3.BaseState<_i2.IssuesModel> get state => (super.noSuchMethod(
        Invocation.getter(#state),
        returnValue: _FakeBaseState_1<_i2.IssuesModel>(
          this,
          Invocation.getter(#state),
        ),
      ) as _i3.BaseState<_i2.IssuesModel>);

  @override
  bool get initialised => (super.noSuchMethod(
        Invocation.getter(#initialised),
        returnValue: false,
      ) as bool);

  @override
  bool get disposed => (super.noSuchMethod(
        Invocation.getter(#disposed),
        returnValue: false,
      ) as bool);

  @override
  set setState(_i3.BaseState<_i2.IssuesModel>? state) => super.noSuchMethod(
        Invocation.setter(
          #setState,
          state,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set setInitialized(bool? value) => super.noSuchMethod(
        Invocation.setter(
          #setInitialized,
          value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  _i5.Future<void> initCalendar({
    required _i6.IssueFilterCallback? filterBottomSheet,
    required _i7.IssueSortCallback? sortBottomSheet,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #initCalendar,
          [],
          {
            #filterBottomSheet: filterBottomSheet,
            #sortBottomSheet: sortBottomSheet,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> moreIssues() => (super.noSuchMethod(
        Invocation.method(
          #moreIssues,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void openIssueDetails(int? index) => super.noSuchMethod(
        Invocation.method(
          #openIssueDetails,
          [index],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.Future<void> sort() => (super.noSuchMethod(
        Invocation.method(
          #sort,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> filter() => (super.noSuchMethod(
        Invocation.method(
          #filter,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  _i5.Future<void> refresh() => (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);

  @override
  void switchTheme() => super.noSuchMethod(
        Invocation.method(
          #switchTheme,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
