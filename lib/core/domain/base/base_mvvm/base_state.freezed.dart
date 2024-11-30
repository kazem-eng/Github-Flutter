// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseState<Data> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Data? data) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Data? data)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Data? data)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateSuccess<Data> value) success,
    required TResult Function(BaseStateInitial<Data> value) initial,
    required TResult Function(BaseStateLoading<Data> value) loading,
    required TResult Function(BaseStateEmpty<Data> value) empty,
    required TResult Function(BaseStateError<Data> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateSuccess<Data> value)? success,
    TResult? Function(BaseStateInitial<Data> value)? initial,
    TResult? Function(BaseStateLoading<Data> value)? loading,
    TResult? Function(BaseStateEmpty<Data> value)? empty,
    TResult? Function(BaseStateError<Data> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateSuccess<Data> value)? success,
    TResult Function(BaseStateInitial<Data> value)? initial,
    TResult Function(BaseStateLoading<Data> value)? loading,
    TResult Function(BaseStateEmpty<Data> value)? empty,
    TResult Function(BaseStateError<Data> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseStateCopyWith<Data, $Res> {
  factory $BaseStateCopyWith(
          BaseState<Data> value, $Res Function(BaseState<Data>) then) =
      _$BaseStateCopyWithImpl<Data, $Res, BaseState<Data>>;
}

/// @nodoc
class _$BaseStateCopyWithImpl<Data, $Res, $Val extends BaseState<Data>>
    implements $BaseStateCopyWith<Data, $Res> {
  _$BaseStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BaseStateSuccessImplCopyWith<Data, $Res> {
  factory _$$BaseStateSuccessImplCopyWith(_$BaseStateSuccessImpl<Data> value,
          $Res Function(_$BaseStateSuccessImpl<Data>) then) =
      __$$BaseStateSuccessImplCopyWithImpl<Data, $Res>;
  @useResult
  $Res call({Data data});
}

/// @nodoc
class __$$BaseStateSuccessImplCopyWithImpl<Data, $Res>
    extends _$BaseStateCopyWithImpl<Data, $Res, _$BaseStateSuccessImpl<Data>>
    implements _$$BaseStateSuccessImplCopyWith<Data, $Res> {
  __$$BaseStateSuccessImplCopyWithImpl(_$BaseStateSuccessImpl<Data> _value,
      $Res Function(_$BaseStateSuccessImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseStateSuccessImpl<Data>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

class _$BaseStateSuccessImpl<Data> implements BaseStateSuccess<Data> {
  const _$BaseStateSuccessImpl(this.data);

  @override
  final Data data;

  @override
  String toString() {
    return 'BaseState<$Data>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateSuccessImpl<Data> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseStateSuccessImplCopyWith<Data, _$BaseStateSuccessImpl<Data>>
      get copyWith => __$$BaseStateSuccessImplCopyWithImpl<Data,
          _$BaseStateSuccessImpl<Data>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Data? data) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Data? data)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Data? data)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateSuccess<Data> value) success,
    required TResult Function(BaseStateInitial<Data> value) initial,
    required TResult Function(BaseStateLoading<Data> value) loading,
    required TResult Function(BaseStateEmpty<Data> value) empty,
    required TResult Function(BaseStateError<Data> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateSuccess<Data> value)? success,
    TResult? Function(BaseStateInitial<Data> value)? initial,
    TResult? Function(BaseStateLoading<Data> value)? loading,
    TResult? Function(BaseStateEmpty<Data> value)? empty,
    TResult? Function(BaseStateError<Data> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateSuccess<Data> value)? success,
    TResult Function(BaseStateInitial<Data> value)? initial,
    TResult Function(BaseStateLoading<Data> value)? loading,
    TResult Function(BaseStateEmpty<Data> value)? empty,
    TResult Function(BaseStateError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BaseStateSuccess<Data> implements BaseState<Data> {
  const factory BaseStateSuccess(final Data data) =
      _$BaseStateSuccessImpl<Data>;

  Data get data;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseStateSuccessImplCopyWith<Data, _$BaseStateSuccessImpl<Data>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseStateInitialImplCopyWith<Data, $Res> {
  factory _$$BaseStateInitialImplCopyWith(_$BaseStateInitialImpl<Data> value,
          $Res Function(_$BaseStateInitialImpl<Data>) then) =
      __$$BaseStateInitialImplCopyWithImpl<Data, $Res>;
}

/// @nodoc
class __$$BaseStateInitialImplCopyWithImpl<Data, $Res>
    extends _$BaseStateCopyWithImpl<Data, $Res, _$BaseStateInitialImpl<Data>>
    implements _$$BaseStateInitialImplCopyWith<Data, $Res> {
  __$$BaseStateInitialImplCopyWithImpl(_$BaseStateInitialImpl<Data> _value,
      $Res Function(_$BaseStateInitialImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BaseStateInitialImpl<Data> implements BaseStateInitial<Data> {
  const _$BaseStateInitialImpl();

  @override
  String toString() {
    return 'BaseState<$Data>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateInitialImpl<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Data? data) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Data? data)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Data? data)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateSuccess<Data> value) success,
    required TResult Function(BaseStateInitial<Data> value) initial,
    required TResult Function(BaseStateLoading<Data> value) loading,
    required TResult Function(BaseStateEmpty<Data> value) empty,
    required TResult Function(BaseStateError<Data> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateSuccess<Data> value)? success,
    TResult? Function(BaseStateInitial<Data> value)? initial,
    TResult? Function(BaseStateLoading<Data> value)? loading,
    TResult? Function(BaseStateEmpty<Data> value)? empty,
    TResult? Function(BaseStateError<Data> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateSuccess<Data> value)? success,
    TResult Function(BaseStateInitial<Data> value)? initial,
    TResult Function(BaseStateLoading<Data> value)? loading,
    TResult Function(BaseStateEmpty<Data> value)? empty,
    TResult Function(BaseStateError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class BaseStateInitial<Data> implements BaseState<Data> {
  const factory BaseStateInitial() = _$BaseStateInitialImpl<Data>;
}

/// @nodoc
abstract class _$$BaseStateLoadingImplCopyWith<Data, $Res> {
  factory _$$BaseStateLoadingImplCopyWith(_$BaseStateLoadingImpl<Data> value,
          $Res Function(_$BaseStateLoadingImpl<Data>) then) =
      __$$BaseStateLoadingImplCopyWithImpl<Data, $Res>;
}

/// @nodoc
class __$$BaseStateLoadingImplCopyWithImpl<Data, $Res>
    extends _$BaseStateCopyWithImpl<Data, $Res, _$BaseStateLoadingImpl<Data>>
    implements _$$BaseStateLoadingImplCopyWith<Data, $Res> {
  __$$BaseStateLoadingImplCopyWithImpl(_$BaseStateLoadingImpl<Data> _value,
      $Res Function(_$BaseStateLoadingImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BaseStateLoadingImpl<Data> implements BaseStateLoading<Data> {
  const _$BaseStateLoadingImpl();

  @override
  String toString() {
    return 'BaseState<$Data>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateLoadingImpl<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Data? data) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Data? data)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Data? data)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateSuccess<Data> value) success,
    required TResult Function(BaseStateInitial<Data> value) initial,
    required TResult Function(BaseStateLoading<Data> value) loading,
    required TResult Function(BaseStateEmpty<Data> value) empty,
    required TResult Function(BaseStateError<Data> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateSuccess<Data> value)? success,
    TResult? Function(BaseStateInitial<Data> value)? initial,
    TResult? Function(BaseStateLoading<Data> value)? loading,
    TResult? Function(BaseStateEmpty<Data> value)? empty,
    TResult? Function(BaseStateError<Data> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateSuccess<Data> value)? success,
    TResult Function(BaseStateInitial<Data> value)? initial,
    TResult Function(BaseStateLoading<Data> value)? loading,
    TResult Function(BaseStateEmpty<Data> value)? empty,
    TResult Function(BaseStateError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class BaseStateLoading<Data> implements BaseState<Data> {
  const factory BaseStateLoading() = _$BaseStateLoadingImpl<Data>;
}

/// @nodoc
abstract class _$$BaseStateEmptyImplCopyWith<Data, $Res> {
  factory _$$BaseStateEmptyImplCopyWith(_$BaseStateEmptyImpl<Data> value,
          $Res Function(_$BaseStateEmptyImpl<Data>) then) =
      __$$BaseStateEmptyImplCopyWithImpl<Data, $Res>;
}

/// @nodoc
class __$$BaseStateEmptyImplCopyWithImpl<Data, $Res>
    extends _$BaseStateCopyWithImpl<Data, $Res, _$BaseStateEmptyImpl<Data>>
    implements _$$BaseStateEmptyImplCopyWith<Data, $Res> {
  __$$BaseStateEmptyImplCopyWithImpl(_$BaseStateEmptyImpl<Data> _value,
      $Res Function(_$BaseStateEmptyImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$BaseStateEmptyImpl<Data> implements BaseStateEmpty<Data> {
  const _$BaseStateEmptyImpl();

  @override
  String toString() {
    return 'BaseState<$Data>.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateEmptyImpl<Data>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Data? data) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Data? data)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Data? data)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateSuccess<Data> value) success,
    required TResult Function(BaseStateInitial<Data> value) initial,
    required TResult Function(BaseStateLoading<Data> value) loading,
    required TResult Function(BaseStateEmpty<Data> value) empty,
    required TResult Function(BaseStateError<Data> value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateSuccess<Data> value)? success,
    TResult? Function(BaseStateInitial<Data> value)? initial,
    TResult? Function(BaseStateLoading<Data> value)? loading,
    TResult? Function(BaseStateEmpty<Data> value)? empty,
    TResult? Function(BaseStateError<Data> value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateSuccess<Data> value)? success,
    TResult Function(BaseStateInitial<Data> value)? initial,
    TResult Function(BaseStateLoading<Data> value)? loading,
    TResult Function(BaseStateEmpty<Data> value)? empty,
    TResult Function(BaseStateError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class BaseStateEmpty<Data> implements BaseState<Data> {
  const factory BaseStateEmpty() = _$BaseStateEmptyImpl<Data>;
}

/// @nodoc
abstract class _$$BaseStateErrorImplCopyWith<Data, $Res> {
  factory _$$BaseStateErrorImplCopyWith(_$BaseStateErrorImpl<Data> value,
          $Res Function(_$BaseStateErrorImpl<Data>) then) =
      __$$BaseStateErrorImplCopyWithImpl<Data, $Res>;
  @useResult
  $Res call({Data? data});
}

/// @nodoc
class __$$BaseStateErrorImplCopyWithImpl<Data, $Res>
    extends _$BaseStateCopyWithImpl<Data, $Res, _$BaseStateErrorImpl<Data>>
    implements _$$BaseStateErrorImplCopyWith<Data, $Res> {
  __$$BaseStateErrorImplCopyWithImpl(_$BaseStateErrorImpl<Data> _value,
      $Res Function(_$BaseStateErrorImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseStateErrorImpl<Data>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
    ));
  }
}

/// @nodoc

class _$BaseStateErrorImpl<Data> implements BaseStateError<Data> {
  const _$BaseStateErrorImpl({this.data = null});

  @override
  @JsonKey()
  final Data? data;

  @override
  String toString() {
    return 'BaseState<$Data>.error(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseStateErrorImpl<Data> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseStateErrorImplCopyWith<Data, _$BaseStateErrorImpl<Data>>
      get copyWith =>
          __$$BaseStateErrorImplCopyWithImpl<Data, _$BaseStateErrorImpl<Data>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() empty,
    required TResult Function(Data? data) error,
  }) {
    return error(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? empty,
    TResult? Function(Data? data)? error,
  }) {
    return error?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? empty,
    TResult Function(Data? data)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseStateSuccess<Data> value) success,
    required TResult Function(BaseStateInitial<Data> value) initial,
    required TResult Function(BaseStateLoading<Data> value) loading,
    required TResult Function(BaseStateEmpty<Data> value) empty,
    required TResult Function(BaseStateError<Data> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseStateSuccess<Data> value)? success,
    TResult? Function(BaseStateInitial<Data> value)? initial,
    TResult? Function(BaseStateLoading<Data> value)? loading,
    TResult? Function(BaseStateEmpty<Data> value)? empty,
    TResult? Function(BaseStateError<Data> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseStateSuccess<Data> value)? success,
    TResult Function(BaseStateInitial<Data> value)? initial,
    TResult Function(BaseStateLoading<Data> value)? loading,
    TResult Function(BaseStateEmpty<Data> value)? empty,
    TResult Function(BaseStateError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BaseStateError<Data> implements BaseState<Data> {
  const factory BaseStateError({final Data? data}) = _$BaseStateErrorImpl<Data>;

  Data? get data;

  /// Create a copy of BaseState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseStateErrorImplCopyWith<Data, _$BaseStateErrorImpl<Data>>
      get copyWith => throw _privateConstructorUsedError;
}
