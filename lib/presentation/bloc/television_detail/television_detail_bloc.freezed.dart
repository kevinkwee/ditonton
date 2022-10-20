// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'television_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TelevisionDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) televisionDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(TelevisionDetail televisionDetail)
        addToWatchlistPressed,
    required TResult Function(TelevisionDetail televisionDetail)
        removeFromWatchlistPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? televisionDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult? Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? televisionDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TelevisionDetailRequested value)
        televisionDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelevisionDetailEventCopyWith<$Res> {
  factory $TelevisionDetailEventCopyWith(TelevisionDetailEvent value,
          $Res Function(TelevisionDetailEvent) then) =
      _$TelevisionDetailEventCopyWithImpl<$Res, TelevisionDetailEvent>;
}

/// @nodoc
class _$TelevisionDetailEventCopyWithImpl<$Res,
        $Val extends TelevisionDetailEvent>
    implements $TelevisionDetailEventCopyWith<$Res> {
  _$TelevisionDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TelevisionDetailRequestedCopyWith<$Res> {
  factory _$$_TelevisionDetailRequestedCopyWith(
          _$_TelevisionDetailRequested value,
          $Res Function(_$_TelevisionDetailRequested) then) =
      __$$_TelevisionDetailRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_TelevisionDetailRequestedCopyWithImpl<$Res>
    extends _$TelevisionDetailEventCopyWithImpl<$Res,
        _$_TelevisionDetailRequested>
    implements _$$_TelevisionDetailRequestedCopyWith<$Res> {
  __$$_TelevisionDetailRequestedCopyWithImpl(
      _$_TelevisionDetailRequested _value,
      $Res Function(_$_TelevisionDetailRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_TelevisionDetailRequested(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_TelevisionDetailRequested implements _TelevisionDetailRequested {
  const _$_TelevisionDetailRequested(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TelevisionDetailEvent.televisionDetailRequested(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TelevisionDetailRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TelevisionDetailRequestedCopyWith<_$_TelevisionDetailRequested>
      get copyWith => __$$_TelevisionDetailRequestedCopyWithImpl<
          _$_TelevisionDetailRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) televisionDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(TelevisionDetail televisionDetail)
        addToWatchlistPressed,
    required TResult Function(TelevisionDetail televisionDetail)
        removeFromWatchlistPressed,
  }) {
    return televisionDetailRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? televisionDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult? Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
  }) {
    return televisionDetailRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? televisionDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (televisionDetailRequested != null) {
      return televisionDetailRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TelevisionDetailRequested value)
        televisionDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) {
    return televisionDetailRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) {
    return televisionDetailRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (televisionDetailRequested != null) {
      return televisionDetailRequested(this);
    }
    return orElse();
  }
}

abstract class _TelevisionDetailRequested implements TelevisionDetailEvent {
  const factory _TelevisionDetailRequested(final int id) =
      _$_TelevisionDetailRequested;

  int get id;
  @JsonKey(ignore: true)
  _$$_TelevisionDetailRequestedCopyWith<_$_TelevisionDetailRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RecommendationRequestedCopyWith<$Res> {
  factory _$$_RecommendationRequestedCopyWith(_$_RecommendationRequested value,
          $Res Function(_$_RecommendationRequested) then) =
      __$$_RecommendationRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_RecommendationRequestedCopyWithImpl<$Res>
    extends _$TelevisionDetailEventCopyWithImpl<$Res,
        _$_RecommendationRequested>
    implements _$$_RecommendationRequestedCopyWith<$Res> {
  __$$_RecommendationRequestedCopyWithImpl(_$_RecommendationRequested _value,
      $Res Function(_$_RecommendationRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_RecommendationRequested(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_RecommendationRequested implements _RecommendationRequested {
  const _$_RecommendationRequested(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TelevisionDetailEvent.recommendationRequested(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecommendationRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecommendationRequestedCopyWith<_$_RecommendationRequested>
      get copyWith =>
          __$$_RecommendationRequestedCopyWithImpl<_$_RecommendationRequested>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) televisionDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(TelevisionDetail televisionDetail)
        addToWatchlistPressed,
    required TResult Function(TelevisionDetail televisionDetail)
        removeFromWatchlistPressed,
  }) {
    return recommendationRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? televisionDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult? Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
  }) {
    return recommendationRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? televisionDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (recommendationRequested != null) {
      return recommendationRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TelevisionDetailRequested value)
        televisionDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) {
    return recommendationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) {
    return recommendationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (recommendationRequested != null) {
      return recommendationRequested(this);
    }
    return orElse();
  }
}

abstract class _RecommendationRequested implements TelevisionDetailEvent {
  const factory _RecommendationRequested(final int id) =
      _$_RecommendationRequested;

  int get id;
  @JsonKey(ignore: true)
  _$$_RecommendationRequestedCopyWith<_$_RecommendationRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_WatchlistStatusRequestedCopyWith<$Res> {
  factory _$$_WatchlistStatusRequestedCopyWith(
          _$_WatchlistStatusRequested value,
          $Res Function(_$_WatchlistStatusRequested) then) =
      __$$_WatchlistStatusRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_WatchlistStatusRequestedCopyWithImpl<$Res>
    extends _$TelevisionDetailEventCopyWithImpl<$Res,
        _$_WatchlistStatusRequested>
    implements _$$_WatchlistStatusRequestedCopyWith<$Res> {
  __$$_WatchlistStatusRequestedCopyWithImpl(_$_WatchlistStatusRequested _value,
      $Res Function(_$_WatchlistStatusRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_WatchlistStatusRequested(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_WatchlistStatusRequested implements _WatchlistStatusRequested {
  const _$_WatchlistStatusRequested(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'TelevisionDetailEvent.watchlistStatusRequested(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WatchlistStatusRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WatchlistStatusRequestedCopyWith<_$_WatchlistStatusRequested>
      get copyWith => __$$_WatchlistStatusRequestedCopyWithImpl<
          _$_WatchlistStatusRequested>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) televisionDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(TelevisionDetail televisionDetail)
        addToWatchlistPressed,
    required TResult Function(TelevisionDetail televisionDetail)
        removeFromWatchlistPressed,
  }) {
    return watchlistStatusRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? televisionDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult? Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
  }) {
    return watchlistStatusRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? televisionDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (watchlistStatusRequested != null) {
      return watchlistStatusRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TelevisionDetailRequested value)
        televisionDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) {
    return watchlistStatusRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) {
    return watchlistStatusRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (watchlistStatusRequested != null) {
      return watchlistStatusRequested(this);
    }
    return orElse();
  }
}

abstract class _WatchlistStatusRequested implements TelevisionDetailEvent {
  const factory _WatchlistStatusRequested(final int id) =
      _$_WatchlistStatusRequested;

  int get id;
  @JsonKey(ignore: true)
  _$$_WatchlistStatusRequestedCopyWith<_$_WatchlistStatusRequested>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddToWatchlistPressedCopyWith<$Res> {
  factory _$$_AddToWatchlistPressedCopyWith(_$_AddToWatchlistPressed value,
          $Res Function(_$_AddToWatchlistPressed) then) =
      __$$_AddToWatchlistPressedCopyWithImpl<$Res>;
  @useResult
  $Res call({TelevisionDetail televisionDetail});
}

/// @nodoc
class __$$_AddToWatchlistPressedCopyWithImpl<$Res>
    extends _$TelevisionDetailEventCopyWithImpl<$Res, _$_AddToWatchlistPressed>
    implements _$$_AddToWatchlistPressedCopyWith<$Res> {
  __$$_AddToWatchlistPressedCopyWithImpl(_$_AddToWatchlistPressed _value,
      $Res Function(_$_AddToWatchlistPressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? televisionDetail = null,
  }) {
    return _then(_$_AddToWatchlistPressed(
      null == televisionDetail
          ? _value.televisionDetail
          : televisionDetail // ignore: cast_nullable_to_non_nullable
              as TelevisionDetail,
    ));
  }
}

/// @nodoc

class _$_AddToWatchlistPressed implements _AddToWatchlistPressed {
  const _$_AddToWatchlistPressed(this.televisionDetail);

  @override
  final TelevisionDetail televisionDetail;

  @override
  String toString() {
    return 'TelevisionDetailEvent.addToWatchlistPressed(televisionDetail: $televisionDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToWatchlistPressed &&
            (identical(other.televisionDetail, televisionDetail) ||
                other.televisionDetail == televisionDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, televisionDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToWatchlistPressedCopyWith<_$_AddToWatchlistPressed> get copyWith =>
      __$$_AddToWatchlistPressedCopyWithImpl<_$_AddToWatchlistPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) televisionDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(TelevisionDetail televisionDetail)
        addToWatchlistPressed,
    required TResult Function(TelevisionDetail televisionDetail)
        removeFromWatchlistPressed,
  }) {
    return addToWatchlistPressed(televisionDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? televisionDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult? Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
  }) {
    return addToWatchlistPressed?.call(televisionDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? televisionDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (addToWatchlistPressed != null) {
      return addToWatchlistPressed(televisionDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TelevisionDetailRequested value)
        televisionDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) {
    return addToWatchlistPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) {
    return addToWatchlistPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (addToWatchlistPressed != null) {
      return addToWatchlistPressed(this);
    }
    return orElse();
  }
}

abstract class _AddToWatchlistPressed implements TelevisionDetailEvent {
  const factory _AddToWatchlistPressed(
      final TelevisionDetail televisionDetail) = _$_AddToWatchlistPressed;

  TelevisionDetail get televisionDetail;
  @JsonKey(ignore: true)
  _$$_AddToWatchlistPressedCopyWith<_$_AddToWatchlistPressed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RemoveFromWatchlistPressedCopyWith<$Res> {
  factory _$$_RemoveFromWatchlistPressedCopyWith(
          _$_RemoveFromWatchlistPressed value,
          $Res Function(_$_RemoveFromWatchlistPressed) then) =
      __$$_RemoveFromWatchlistPressedCopyWithImpl<$Res>;
  @useResult
  $Res call({TelevisionDetail televisionDetail});
}

/// @nodoc
class __$$_RemoveFromWatchlistPressedCopyWithImpl<$Res>
    extends _$TelevisionDetailEventCopyWithImpl<$Res,
        _$_RemoveFromWatchlistPressed>
    implements _$$_RemoveFromWatchlistPressedCopyWith<$Res> {
  __$$_RemoveFromWatchlistPressedCopyWithImpl(
      _$_RemoveFromWatchlistPressed _value,
      $Res Function(_$_RemoveFromWatchlistPressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? televisionDetail = null,
  }) {
    return _then(_$_RemoveFromWatchlistPressed(
      null == televisionDetail
          ? _value.televisionDetail
          : televisionDetail // ignore: cast_nullable_to_non_nullable
              as TelevisionDetail,
    ));
  }
}

/// @nodoc

class _$_RemoveFromWatchlistPressed implements _RemoveFromWatchlistPressed {
  const _$_RemoveFromWatchlistPressed(this.televisionDetail);

  @override
  final TelevisionDetail televisionDetail;

  @override
  String toString() {
    return 'TelevisionDetailEvent.removeFromWatchlistPressed(televisionDetail: $televisionDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveFromWatchlistPressed &&
            (identical(other.televisionDetail, televisionDetail) ||
                other.televisionDetail == televisionDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, televisionDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveFromWatchlistPressedCopyWith<_$_RemoveFromWatchlistPressed>
      get copyWith => __$$_RemoveFromWatchlistPressedCopyWithImpl<
          _$_RemoveFromWatchlistPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) televisionDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(TelevisionDetail televisionDetail)
        addToWatchlistPressed,
    required TResult Function(TelevisionDetail televisionDetail)
        removeFromWatchlistPressed,
  }) {
    return removeFromWatchlistPressed(televisionDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? televisionDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult? Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
  }) {
    return removeFromWatchlistPressed?.call(televisionDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? televisionDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(TelevisionDetail televisionDetail)? addToWatchlistPressed,
    TResult Function(TelevisionDetail televisionDetail)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (removeFromWatchlistPressed != null) {
      return removeFromWatchlistPressed(televisionDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TelevisionDetailRequested value)
        televisionDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) {
    return removeFromWatchlistPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) {
    return removeFromWatchlistPressed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TelevisionDetailRequested value)?
        televisionDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (removeFromWatchlistPressed != null) {
      return removeFromWatchlistPressed(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromWatchlistPressed implements TelevisionDetailEvent {
  const factory _RemoveFromWatchlistPressed(
      final TelevisionDetail televisionDetail) = _$_RemoveFromWatchlistPressed;

  TelevisionDetail get televisionDetail;
  @JsonKey(ignore: true)
  _$$_RemoveFromWatchlistPressedCopyWith<_$_RemoveFromWatchlistPressed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TelevisionDetailState {
  TelevisionDetailFetchState get televisionDetailFetchState =>
      throw _privateConstructorUsedError;
  TvRecommendationFetchState get tvRecommendationFetchState =>
      throw _privateConstructorUsedError;
  WatchlistActionState get watchlistActionState =>
      throw _privateConstructorUsedError;
  bool get isAddedToWatchlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TelevisionDetailStateCopyWith<TelevisionDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TelevisionDetailStateCopyWith<$Res> {
  factory $TelevisionDetailStateCopyWith(TelevisionDetailState value,
          $Res Function(TelevisionDetailState) then) =
      _$TelevisionDetailStateCopyWithImpl<$Res, TelevisionDetailState>;
  @useResult
  $Res call(
      {TelevisionDetailFetchState televisionDetailFetchState,
      TvRecommendationFetchState tvRecommendationFetchState,
      WatchlistActionState watchlistActionState,
      bool isAddedToWatchlist});

  $TelevisionDetailFetchStateCopyWith<$Res> get televisionDetailFetchState;
  $TvRecommendationFetchStateCopyWith<$Res> get tvRecommendationFetchState;
  $WatchlistActionStateCopyWith<$Res> get watchlistActionState;
}

/// @nodoc
class _$TelevisionDetailStateCopyWithImpl<$Res,
        $Val extends TelevisionDetailState>
    implements $TelevisionDetailStateCopyWith<$Res> {
  _$TelevisionDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? televisionDetailFetchState = null,
    Object? tvRecommendationFetchState = null,
    Object? watchlistActionState = null,
    Object? isAddedToWatchlist = null,
  }) {
    return _then(_value.copyWith(
      televisionDetailFetchState: null == televisionDetailFetchState
          ? _value.televisionDetailFetchState
          : televisionDetailFetchState // ignore: cast_nullable_to_non_nullable
              as TelevisionDetailFetchState,
      tvRecommendationFetchState: null == tvRecommendationFetchState
          ? _value.tvRecommendationFetchState
          : tvRecommendationFetchState // ignore: cast_nullable_to_non_nullable
              as TvRecommendationFetchState,
      watchlistActionState: null == watchlistActionState
          ? _value.watchlistActionState
          : watchlistActionState // ignore: cast_nullable_to_non_nullable
              as WatchlistActionState,
      isAddedToWatchlist: null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TelevisionDetailFetchStateCopyWith<$Res> get televisionDetailFetchState {
    return $TelevisionDetailFetchStateCopyWith<$Res>(
        _value.televisionDetailFetchState, (value) {
      return _then(_value.copyWith(televisionDetailFetchState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TvRecommendationFetchStateCopyWith<$Res> get tvRecommendationFetchState {
    return $TvRecommendationFetchStateCopyWith<$Res>(
        _value.tvRecommendationFetchState, (value) {
      return _then(_value.copyWith(tvRecommendationFetchState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WatchlistActionStateCopyWith<$Res> get watchlistActionState {
    return $WatchlistActionStateCopyWith<$Res>(_value.watchlistActionState,
        (value) {
      return _then(_value.copyWith(watchlistActionState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TelevisionDetailStateCopyWith<$Res>
    implements $TelevisionDetailStateCopyWith<$Res> {
  factory _$$_TelevisionDetailStateCopyWith(_$_TelevisionDetailState value,
          $Res Function(_$_TelevisionDetailState) then) =
      __$$_TelevisionDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TelevisionDetailFetchState televisionDetailFetchState,
      TvRecommendationFetchState tvRecommendationFetchState,
      WatchlistActionState watchlistActionState,
      bool isAddedToWatchlist});

  @override
  $TelevisionDetailFetchStateCopyWith<$Res> get televisionDetailFetchState;
  @override
  $TvRecommendationFetchStateCopyWith<$Res> get tvRecommendationFetchState;
  @override
  $WatchlistActionStateCopyWith<$Res> get watchlistActionState;
}

/// @nodoc
class __$$_TelevisionDetailStateCopyWithImpl<$Res>
    extends _$TelevisionDetailStateCopyWithImpl<$Res, _$_TelevisionDetailState>
    implements _$$_TelevisionDetailStateCopyWith<$Res> {
  __$$_TelevisionDetailStateCopyWithImpl(_$_TelevisionDetailState _value,
      $Res Function(_$_TelevisionDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? televisionDetailFetchState = null,
    Object? tvRecommendationFetchState = null,
    Object? watchlistActionState = null,
    Object? isAddedToWatchlist = null,
  }) {
    return _then(_$_TelevisionDetailState(
      televisionDetailFetchState: null == televisionDetailFetchState
          ? _value.televisionDetailFetchState
          : televisionDetailFetchState // ignore: cast_nullable_to_non_nullable
              as TelevisionDetailFetchState,
      tvRecommendationFetchState: null == tvRecommendationFetchState
          ? _value.tvRecommendationFetchState
          : tvRecommendationFetchState // ignore: cast_nullable_to_non_nullable
              as TvRecommendationFetchState,
      watchlistActionState: null == watchlistActionState
          ? _value.watchlistActionState
          : watchlistActionState // ignore: cast_nullable_to_non_nullable
              as WatchlistActionState,
      isAddedToWatchlist: null == isAddedToWatchlist
          ? _value.isAddedToWatchlist
          : isAddedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TelevisionDetailState implements _TelevisionDetailState {
  const _$_TelevisionDetailState(
      {required this.televisionDetailFetchState,
      required this.tvRecommendationFetchState,
      required this.watchlistActionState,
      required this.isAddedToWatchlist});

  @override
  final TelevisionDetailFetchState televisionDetailFetchState;
  @override
  final TvRecommendationFetchState tvRecommendationFetchState;
  @override
  final WatchlistActionState watchlistActionState;
  @override
  final bool isAddedToWatchlist;

  @override
  String toString() {
    return 'TelevisionDetailState(televisionDetailFetchState: $televisionDetailFetchState, tvRecommendationFetchState: $tvRecommendationFetchState, watchlistActionState: $watchlistActionState, isAddedToWatchlist: $isAddedToWatchlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TelevisionDetailState &&
            (identical(other.televisionDetailFetchState,
                    televisionDetailFetchState) ||
                other.televisionDetailFetchState ==
                    televisionDetailFetchState) &&
            (identical(other.tvRecommendationFetchState,
                    tvRecommendationFetchState) ||
                other.tvRecommendationFetchState ==
                    tvRecommendationFetchState) &&
            (identical(other.watchlistActionState, watchlistActionState) ||
                other.watchlistActionState == watchlistActionState) &&
            (identical(other.isAddedToWatchlist, isAddedToWatchlist) ||
                other.isAddedToWatchlist == isAddedToWatchlist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, televisionDetailFetchState,
      tvRecommendationFetchState, watchlistActionState, isAddedToWatchlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TelevisionDetailStateCopyWith<_$_TelevisionDetailState> get copyWith =>
      __$$_TelevisionDetailStateCopyWithImpl<_$_TelevisionDetailState>(
          this, _$identity);
}

abstract class _TelevisionDetailState implements TelevisionDetailState {
  const factory _TelevisionDetailState(
      {required final TelevisionDetailFetchState televisionDetailFetchState,
      required final TvRecommendationFetchState tvRecommendationFetchState,
      required final WatchlistActionState watchlistActionState,
      required final bool isAddedToWatchlist}) = _$_TelevisionDetailState;

  @override
  TelevisionDetailFetchState get televisionDetailFetchState;
  @override
  TvRecommendationFetchState get tvRecommendationFetchState;
  @override
  WatchlistActionState get watchlistActionState;
  @override
  bool get isAddedToWatchlist;
  @override
  @JsonKey(ignore: true)
  _$$_TelevisionDetailStateCopyWith<_$_TelevisionDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
