import 'package:flutter_issues_viewer/core/base/base_exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_state.freezed.dart';

@freezed
class BaseState<Data> with _$BaseState<Data> {
  const factory BaseState.success(Data data) = BaseStateSuccess;
  const factory BaseState.initial() = BaseStateInitial;
  const factory BaseState.loading() = BaseStateLoading;
  const factory BaseState.empty() = BaseStateEmpty;
  const factory BaseState.error({
    @Default(null) Data? data,
    @Default(null) BaseException? exception,
  }) = BaseStateError<Data>;
}
