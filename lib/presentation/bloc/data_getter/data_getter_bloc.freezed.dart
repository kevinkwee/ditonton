// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'data_getter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DataGetterEvent<P> {
  P get params => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(P params) requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(P params)? requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(P params)? requested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Requested<P> value) requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Requested<P> value)? requested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Requested<P> value)? requested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DataGetterEventCopyWith<P, DataGetterEvent<P>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataGetterEventCopyWith<P, $Res> {
  factory $DataGetterEventCopyWith(
          DataGetterEvent<P> value, $Res Function(DataGetterEvent<P>) then) =
      _$DataGetterEventCopyWithImpl<P, $Res, DataGetterEvent<P>>;
  @useResult
  $Res call({P params});
}

/// @nodoc
class _$DataGetterEventCopyWithImpl<P, $Res, $Val extends DataGetterEvent<P>>
    implements $DataGetterEventCopyWith<P, $Res> {
  _$DataGetterEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_value.copyWith(
      params: null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as P,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RequestedCopyWith<P, $Res>
    implements $DataGetterEventCopyWith<P, $Res> {
  factory _$$_RequestedCopyWith(
          _$_Requested<P> value, $Res Function(_$_Requested<P>) then) =
      __$$_RequestedCopyWithImpl<P, $Res>;
  @override
  @useResult
  $Res call({P params});
}

/// @nodoc
class __$$_RequestedCopyWithImpl<P, $Res>
    extends _$DataGetterEventCopyWithImpl<P, $Res, _$_Requested<P>>
    implements _$$_RequestedCopyWith<P, $Res> {
  __$$_RequestedCopyWithImpl(
      _$_Requested<P> _value, $Res Function(_$_Requested<P>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? params = null,
  }) {
    return _then(_$_Requested<P>(
      null == params
          ? _value.params
          : params // ignore: cast_nullable_to_non_nullable
              as P,
    ));
  }
}

/// @nodoc

class _$_Requested<P> implements _Requested<P> {
  _$_Requested(this.params);

  @override
  final P params;

  @override
  String toString() {
    return 'DataGetterEvent<$P>.requested(params: $params)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Requested<P> &&
            const DeepCollectionEquality().equals(other.params, params));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(params));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RequestedCopyWith<P, _$_Requested<P>> get copyWith =>
      __$$_RequestedCopyWithImpl<P, _$_Requested<P>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(P params) requested,
  }) {
    return requested(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(P params)? requested,
  }) {
    return requested?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(P params)? requested,
    required TResult orElse(),
  }) {
    if (requested != null) {
      return requested(params);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Requested<P> value) requested,
  }) {
    return requested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Requested<P> value)? requested,
  }) {
    return requested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Requested<P> value)? requested,
    required TResult orElse(),
  }) {
    if (requested != null) {
      return requested(this);
    }
    return orElse();
  }
}

abstract class _Requested<P> implements DataGetterEvent<P> {
  factory _Requested(final P params) = _$_Requested<P>;

  @override
  P get params;
  @override
  @JsonKey(ignore: true)
  _$$_RequestedCopyWith<P, _$_Requested<P>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$DataGetterState<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(T data) loadSuccess,
    required TResult Function(String message) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(T data)? loadSuccess,
    TResult? Function(String message)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(T data)? loadSuccess,
    TResult Function(String message)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_LoadSuccess<T> value) loadSuccess,
    required TResult Function(_LoadFailure<T> value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_LoadInProgress<T> value)? loadInProgress,
    TResult? Function(_LoadSuccess<T> value)? loadSuccess,
    TResult? Function(_LoadFailure<T> value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_LoadSuccess<T> value)? loadSuccess,
    TResult Function(_LoadFailure<T> value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataGetterStateCopyWith<T, $Res> {
  factory $DataGetterStateCopyWith(
          DataGetterState<T> value, $Res Function(DataGetterState<T>) then) =
      _$DataGetterStateCopyWithImpl<T, $Res, DataGetterState<T>>;
}

/// @nodoc
class _$DataGetterStateCopyWithImpl<T, $Res, $Val extends DataGetterState<T>>
    implements $DataGetterStateCopyWith<T, $Res> {
  _$DataGetterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<T, $Res> {
  factory _$$_InitialCopyWith(
          _$_Initial<T> value, $Res Function(_$_Initial<T>) then) =
      __$$_InitialCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<T, $Res>
    extends _$DataGetterStateCopyWithImpl<T, $Res, _$_Initial<T>>
    implements _$$_InitialCopyWith<T, $Res> {
  __$$_InitialCopyWithImpl(
      _$_Initial<T> _value, $Res Function(_$_Initial<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial<T> implements _Initial<T> {
  const _$_Initial();

  @override
  String toString() {
    return 'DataGetterState<$T>.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(T data) loadSuccess,
    required TResult Function(String message) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(T data)? loadSuccess,
    TResult? Function(String message)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(T data)? loadSuccess,
    TResult Function(String message)? loadFailure,
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
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_LoadSuccess<T> value) loadSuccess,
    required TResult Function(_LoadFailure<T> value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_LoadInProgress<T> value)? loadInProgress,
    TResult? Function(_LoadSuccess<T> value)? loadSuccess,
    TResult? Function(_LoadFailure<T> value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_LoadSuccess<T> value)? loadSuccess,
    TResult Function(_LoadFailure<T> value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial<T> implements DataGetterState<T> {
  const factory _Initial() = _$_Initial<T>;
}

/// @nodoc
abstract class _$$_LoadInProgressCopyWith<T, $Res> {
  factory _$$_LoadInProgressCopyWith(_$_LoadInProgress<T> value,
          $Res Function(_$_LoadInProgress<T>) then) =
      __$$_LoadInProgressCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$$_LoadInProgressCopyWithImpl<T, $Res>
    extends _$DataGetterStateCopyWithImpl<T, $Res, _$_LoadInProgress<T>>
    implements _$$_LoadInProgressCopyWith<T, $Res> {
  __$$_LoadInProgressCopyWithImpl(
      _$_LoadInProgress<T> _value, $Res Function(_$_LoadInProgress<T>) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadInProgress<T> implements _LoadInProgress<T> {
  const _$_LoadInProgress();

  @override
  String toString() {
    return 'DataGetterState<$T>.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadInProgress<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(T data) loadSuccess,
    required TResult Function(String message) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(T data)? loadSuccess,
    TResult? Function(String message)? loadFailure,
  }) {
    return loadInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(T data)? loadSuccess,
    TResult Function(String message)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_LoadSuccess<T> value) loadSuccess,
    required TResult Function(_LoadFailure<T> value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_LoadInProgress<T> value)? loadInProgress,
    TResult? Function(_LoadSuccess<T> value)? loadSuccess,
    TResult? Function(_LoadFailure<T> value)? loadFailure,
  }) {
    return loadInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_LoadSuccess<T> value)? loadSuccess,
    TResult Function(_LoadFailure<T> value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class _LoadInProgress<T> implements DataGetterState<T> {
  const factory _LoadInProgress() = _$_LoadInProgress<T>;
}

/// @nodoc
abstract class _$$_LoadSuccessCopyWith<T, $Res> {
  factory _$$_LoadSuccessCopyWith(
          _$_LoadSuccess<T> value, $Res Function(_$_LoadSuccess<T>) then) =
      __$$_LoadSuccessCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$_LoadSuccessCopyWithImpl<T, $Res>
    extends _$DataGetterStateCopyWithImpl<T, $Res, _$_LoadSuccess<T>>
    implements _$$_LoadSuccessCopyWith<T, $Res> {
  __$$_LoadSuccessCopyWithImpl(
      _$_LoadSuccess<T> _value, $Res Function(_$_LoadSuccess<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$_LoadSuccess<T>(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$_LoadSuccess<T> implements _LoadSuccess<T> {
  const _$_LoadSuccess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'DataGetterState<$T>.loadSuccess(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadSuccessCopyWith<T, _$_LoadSuccess<T>> get copyWith =>
      __$$_LoadSuccessCopyWithImpl<T, _$_LoadSuccess<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(T data) loadSuccess,
    required TResult Function(String message) loadFailure,
  }) {
    return loadSuccess(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(T data)? loadSuccess,
    TResult? Function(String message)? loadFailure,
  }) {
    return loadSuccess?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(T data)? loadSuccess,
    TResult Function(String message)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_LoadSuccess<T> value) loadSuccess,
    required TResult Function(_LoadFailure<T> value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_LoadInProgress<T> value)? loadInProgress,
    TResult? Function(_LoadSuccess<T> value)? loadSuccess,
    TResult? Function(_LoadFailure<T> value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_LoadSuccess<T> value)? loadSuccess,
    TResult Function(_LoadFailure<T> value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _LoadSuccess<T> implements DataGetterState<T> {
  const factory _LoadSuccess(final T data) = _$_LoadSuccess<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$_LoadSuccessCopyWith<T, _$_LoadSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadFailureCopyWith<T, $Res> {
  factory _$$_LoadFailureCopyWith(
          _$_LoadFailure<T> value, $Res Function(_$_LoadFailure<T>) then) =
      __$$_LoadFailureCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_LoadFailureCopyWithImpl<T, $Res>
    extends _$DataGetterStateCopyWithImpl<T, $Res, _$_LoadFailure<T>>
    implements _$$_LoadFailureCopyWith<T, $Res> {
  __$$_LoadFailureCopyWithImpl(
      _$_LoadFailure<T> _value, $Res Function(_$_LoadFailure<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_LoadFailure<T>(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoadFailure<T> implements _LoadFailure<T> {
  const _$_LoadFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'DataGetterState<$T>.loadFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadFailure<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadFailureCopyWith<T, _$_LoadFailure<T>> get copyWith =>
      __$$_LoadFailureCopyWithImpl<T, _$_LoadFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(T data) loadSuccess,
    required TResult Function(String message) loadFailure,
  }) {
    return loadFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loadInProgress,
    TResult? Function(T data)? loadSuccess,
    TResult? Function(String message)? loadFailure,
  }) {
    return loadFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(T data)? loadSuccess,
    TResult Function(String message)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial<T> value) initial,
    required TResult Function(_LoadInProgress<T> value) loadInProgress,
    required TResult Function(_LoadSuccess<T> value) loadSuccess,
    required TResult Function(_LoadFailure<T> value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial<T> value)? initial,
    TResult? Function(_LoadInProgress<T> value)? loadInProgress,
    TResult? Function(_LoadSuccess<T> value)? loadSuccess,
    TResult? Function(_LoadFailure<T> value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial<T> value)? initial,
    TResult Function(_LoadInProgress<T> value)? loadInProgress,
    TResult Function(_LoadSuccess<T> value)? loadSuccess,
    TResult Function(_LoadFailure<T> value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _LoadFailure<T> implements DataGetterState<T> {
  const factory _LoadFailure(final String message) = _$_LoadFailure<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$_LoadFailureCopyWith<T, _$_LoadFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
