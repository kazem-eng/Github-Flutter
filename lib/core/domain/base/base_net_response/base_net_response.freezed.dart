// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base_net_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BaseNetResponse<Data> {
  Data? get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function(Data? data, String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function(Data? data, String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function(Data? data, String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseNetResponseSuccess<Data> value) success,
    required TResult Function(BaseNetResponseError<Data> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseNetResponseSuccess<Data> value)? success,
    TResult? Function(BaseNetResponseError<Data> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseNetResponseSuccess<Data> value)? success,
    TResult Function(BaseNetResponseError<Data> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseNetResponseCopyWith<Data, $Res> {
  factory $BaseNetResponseCopyWith(BaseNetResponse<Data> value,
          $Res Function(BaseNetResponse<Data>) then) =
      _$BaseNetResponseCopyWithImpl<Data, $Res, BaseNetResponse<Data>>;
}

/// @nodoc
class _$BaseNetResponseCopyWithImpl<Data, $Res,
        $Val extends BaseNetResponse<Data>>
    implements $BaseNetResponseCopyWith<Data, $Res> {
  _$BaseNetResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$BaseNetResponseSuccessImplCopyWith<Data, $Res> {
  factory _$$BaseNetResponseSuccessImplCopyWith(
          _$BaseNetResponseSuccessImpl<Data> value,
          $Res Function(_$BaseNetResponseSuccessImpl<Data>) then) =
      __$$BaseNetResponseSuccessImplCopyWithImpl<Data, $Res>;
  @useResult
  $Res call({Data data});
}

/// @nodoc
class __$$BaseNetResponseSuccessImplCopyWithImpl<Data, $Res>
    extends _$BaseNetResponseCopyWithImpl<Data, $Res,
        _$BaseNetResponseSuccessImpl<Data>>
    implements _$$BaseNetResponseSuccessImplCopyWith<Data, $Res> {
  __$$BaseNetResponseSuccessImplCopyWithImpl(
      _$BaseNetResponseSuccessImpl<Data> _value,
      $Res Function(_$BaseNetResponseSuccessImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$BaseNetResponseSuccessImpl<Data>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data,
    ));
  }
}

/// @nodoc

class _$BaseNetResponseSuccessImpl<Data> extends BaseNetResponseSuccess<Data> {
  const _$BaseNetResponseSuccessImpl(this.data) : super._();

  @override
  final Data data;

  @override
  String toString() {
    return 'BaseNetResponse<$Data>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseNetResponseSuccessImpl<Data> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseNetResponseSuccessImplCopyWith<Data,
          _$BaseNetResponseSuccessImpl<Data>>
      get copyWith => __$$BaseNetResponseSuccessImplCopyWithImpl<Data,
          _$BaseNetResponseSuccessImpl<Data>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function(Data? data, String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function(Data? data, String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function(Data? data, String message)? error,
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
    required TResult Function(BaseNetResponseSuccess<Data> value) success,
    required TResult Function(BaseNetResponseError<Data> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseNetResponseSuccess<Data> value)? success,
    TResult? Function(BaseNetResponseError<Data> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseNetResponseSuccess<Data> value)? success,
    TResult Function(BaseNetResponseError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class BaseNetResponseSuccess<Data> extends BaseNetResponse<Data> {
  const factory BaseNetResponseSuccess(final Data data) =
      _$BaseNetResponseSuccessImpl<Data>;
  const BaseNetResponseSuccess._() : super._();

  @override
  Data get data;

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseNetResponseSuccessImplCopyWith<Data,
          _$BaseNetResponseSuccessImpl<Data>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BaseNetResponseErrorImplCopyWith<Data, $Res> {
  factory _$$BaseNetResponseErrorImplCopyWith(
          _$BaseNetResponseErrorImpl<Data> value,
          $Res Function(_$BaseNetResponseErrorImpl<Data>) then) =
      __$$BaseNetResponseErrorImplCopyWithImpl<Data, $Res>;
  @useResult
  $Res call({Data? data, String message});
}

/// @nodoc
class __$$BaseNetResponseErrorImplCopyWithImpl<Data, $Res>
    extends _$BaseNetResponseCopyWithImpl<Data, $Res,
        _$BaseNetResponseErrorImpl<Data>>
    implements _$$BaseNetResponseErrorImplCopyWith<Data, $Res> {
  __$$BaseNetResponseErrorImplCopyWithImpl(
      _$BaseNetResponseErrorImpl<Data> _value,
      $Res Function(_$BaseNetResponseErrorImpl<Data>) _then)
      : super(_value, _then);

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? message = null,
  }) {
    return _then(_$BaseNetResponseErrorImpl<Data>(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BaseNetResponseErrorImpl<Data> extends BaseNetResponseError<Data> {
  const _$BaseNetResponseErrorImpl({this.data = null, this.message = ''})
      : super._();

  @override
  @JsonKey()
  final Data? data;
  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'BaseNetResponse<$Data>.error(data: $data, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseNetResponseErrorImpl<Data> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(data), message);

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseNetResponseErrorImplCopyWith<Data, _$BaseNetResponseErrorImpl<Data>>
      get copyWith => __$$BaseNetResponseErrorImplCopyWithImpl<Data,
          _$BaseNetResponseErrorImpl<Data>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Data data) success,
    required TResult Function(Data? data, String message) error,
  }) {
    return error(data, message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Data data)? success,
    TResult? Function(Data? data, String message)? error,
  }) {
    return error?.call(data, message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Data data)? success,
    TResult Function(Data? data, String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(data, message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(BaseNetResponseSuccess<Data> value) success,
    required TResult Function(BaseNetResponseError<Data> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(BaseNetResponseSuccess<Data> value)? success,
    TResult? Function(BaseNetResponseError<Data> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(BaseNetResponseSuccess<Data> value)? success,
    TResult Function(BaseNetResponseError<Data> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class BaseNetResponseError<Data> extends BaseNetResponse<Data> {
  const factory BaseNetResponseError({final Data? data, final String message}) =
      _$BaseNetResponseErrorImpl<Data>;
  const BaseNetResponseError._() : super._();

  @override
  Data? get data;
  String get message;

  /// Create a copy of BaseNetResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseNetResponseErrorImplCopyWith<Data, _$BaseNetResponseErrorImpl<Data>>
      get copyWith => throw _privateConstructorUsedError;
}
