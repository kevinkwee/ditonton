// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'movie_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MovieDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) movieDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(MovieDetail movieDetail) addToWatchlistPressed,
    required TResult Function(MovieDetail movieDetail)
        removeFromWatchlistPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? movieDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult? Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? movieDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieDetailRequested value) movieDetailRequested,
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
    TResult? Function(_MovieDetailRequested value)? movieDetailRequested,
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
    TResult Function(_MovieDetailRequested value)? movieDetailRequested,
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
abstract class $MovieDetailEventCopyWith<$Res> {
  factory $MovieDetailEventCopyWith(
          MovieDetailEvent value, $Res Function(MovieDetailEvent) then) =
      _$MovieDetailEventCopyWithImpl<$Res, MovieDetailEvent>;
}

/// @nodoc
class _$MovieDetailEventCopyWithImpl<$Res, $Val extends MovieDetailEvent>
    implements $MovieDetailEventCopyWith<$Res> {
  _$MovieDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_MovieDetailRequestedCopyWith<$Res> {
  factory _$$_MovieDetailRequestedCopyWith(_$_MovieDetailRequested value,
          $Res Function(_$_MovieDetailRequested) then) =
      __$$_MovieDetailRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_MovieDetailRequestedCopyWithImpl<$Res>
    extends _$MovieDetailEventCopyWithImpl<$Res, _$_MovieDetailRequested>
    implements _$$_MovieDetailRequestedCopyWith<$Res> {
  __$$_MovieDetailRequestedCopyWithImpl(_$_MovieDetailRequested _value,
      $Res Function(_$_MovieDetailRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_MovieDetailRequested(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_MovieDetailRequested implements _MovieDetailRequested {
  const _$_MovieDetailRequested(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'MovieDetailEvent.movieDetailRequested(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieDetailRequested &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieDetailRequestedCopyWith<_$_MovieDetailRequested> get copyWith =>
      __$$_MovieDetailRequestedCopyWithImpl<_$_MovieDetailRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) movieDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(MovieDetail movieDetail) addToWatchlistPressed,
    required TResult Function(MovieDetail movieDetail)
        removeFromWatchlistPressed,
  }) {
    return movieDetailRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? movieDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult? Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
  }) {
    return movieDetailRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? movieDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (movieDetailRequested != null) {
      return movieDetailRequested(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieDetailRequested value) movieDetailRequested,
    required TResult Function(_RecommendationRequested value)
        recommendationRequested,
    required TResult Function(_WatchlistStatusRequested value)
        watchlistStatusRequested,
    required TResult Function(_AddToWatchlistPressed value)
        addToWatchlistPressed,
    required TResult Function(_RemoveFromWatchlistPressed value)
        removeFromWatchlistPressed,
  }) {
    return movieDetailRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_MovieDetailRequested value)? movieDetailRequested,
    TResult? Function(_RecommendationRequested value)? recommendationRequested,
    TResult? Function(_WatchlistStatusRequested value)?
        watchlistStatusRequested,
    TResult? Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult? Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
  }) {
    return movieDetailRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_MovieDetailRequested value)? movieDetailRequested,
    TResult Function(_RecommendationRequested value)? recommendationRequested,
    TResult Function(_WatchlistStatusRequested value)? watchlistStatusRequested,
    TResult Function(_AddToWatchlistPressed value)? addToWatchlistPressed,
    TResult Function(_RemoveFromWatchlistPressed value)?
        removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (movieDetailRequested != null) {
      return movieDetailRequested(this);
    }
    return orElse();
  }
}

abstract class _MovieDetailRequested implements MovieDetailEvent {
  const factory _MovieDetailRequested(final int id) = _$_MovieDetailRequested;

  int get id;
  @JsonKey(ignore: true)
  _$$_MovieDetailRequestedCopyWith<_$_MovieDetailRequested> get copyWith =>
      throw _privateConstructorUsedError;
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
    extends _$MovieDetailEventCopyWithImpl<$Res, _$_RecommendationRequested>
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
    return 'MovieDetailEvent.recommendationRequested(id: $id)';
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
    required TResult Function(int id) movieDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(MovieDetail movieDetail) addToWatchlistPressed,
    required TResult Function(MovieDetail movieDetail)
        removeFromWatchlistPressed,
  }) {
    return recommendationRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? movieDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult? Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
  }) {
    return recommendationRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? movieDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
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
    required TResult Function(_MovieDetailRequested value) movieDetailRequested,
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
    TResult? Function(_MovieDetailRequested value)? movieDetailRequested,
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
    TResult Function(_MovieDetailRequested value)? movieDetailRequested,
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

abstract class _RecommendationRequested implements MovieDetailEvent {
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
    extends _$MovieDetailEventCopyWithImpl<$Res, _$_WatchlistStatusRequested>
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
    return 'MovieDetailEvent.watchlistStatusRequested(id: $id)';
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
    required TResult Function(int id) movieDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(MovieDetail movieDetail) addToWatchlistPressed,
    required TResult Function(MovieDetail movieDetail)
        removeFromWatchlistPressed,
  }) {
    return watchlistStatusRequested(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? movieDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult? Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
  }) {
    return watchlistStatusRequested?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? movieDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
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
    required TResult Function(_MovieDetailRequested value) movieDetailRequested,
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
    TResult? Function(_MovieDetailRequested value)? movieDetailRequested,
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
    TResult Function(_MovieDetailRequested value)? movieDetailRequested,
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

abstract class _WatchlistStatusRequested implements MovieDetailEvent {
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
  $Res call({MovieDetail movieDetail});
}

/// @nodoc
class __$$_AddToWatchlistPressedCopyWithImpl<$Res>
    extends _$MovieDetailEventCopyWithImpl<$Res, _$_AddToWatchlistPressed>
    implements _$$_AddToWatchlistPressedCopyWith<$Res> {
  __$$_AddToWatchlistPressedCopyWithImpl(_$_AddToWatchlistPressed _value,
      $Res Function(_$_AddToWatchlistPressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieDetail = null,
  }) {
    return _then(_$_AddToWatchlistPressed(
      null == movieDetail
          ? _value.movieDetail
          : movieDetail // ignore: cast_nullable_to_non_nullable
              as MovieDetail,
    ));
  }
}

/// @nodoc

class _$_AddToWatchlistPressed implements _AddToWatchlistPressed {
  const _$_AddToWatchlistPressed(this.movieDetail);

  @override
  final MovieDetail movieDetail;

  @override
  String toString() {
    return 'MovieDetailEvent.addToWatchlistPressed(movieDetail: $movieDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddToWatchlistPressed &&
            (identical(other.movieDetail, movieDetail) ||
                other.movieDetail == movieDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddToWatchlistPressedCopyWith<_$_AddToWatchlistPressed> get copyWith =>
      __$$_AddToWatchlistPressedCopyWithImpl<_$_AddToWatchlistPressed>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) movieDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(MovieDetail movieDetail) addToWatchlistPressed,
    required TResult Function(MovieDetail movieDetail)
        removeFromWatchlistPressed,
  }) {
    return addToWatchlistPressed(movieDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? movieDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult? Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
  }) {
    return addToWatchlistPressed?.call(movieDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? movieDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (addToWatchlistPressed != null) {
      return addToWatchlistPressed(movieDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieDetailRequested value) movieDetailRequested,
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
    TResult? Function(_MovieDetailRequested value)? movieDetailRequested,
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
    TResult Function(_MovieDetailRequested value)? movieDetailRequested,
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

abstract class _AddToWatchlistPressed implements MovieDetailEvent {
  const factory _AddToWatchlistPressed(final MovieDetail movieDetail) =
      _$_AddToWatchlistPressed;

  MovieDetail get movieDetail;
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
  $Res call({MovieDetail movieDetail});
}

/// @nodoc
class __$$_RemoveFromWatchlistPressedCopyWithImpl<$Res>
    extends _$MovieDetailEventCopyWithImpl<$Res, _$_RemoveFromWatchlistPressed>
    implements _$$_RemoveFromWatchlistPressedCopyWith<$Res> {
  __$$_RemoveFromWatchlistPressedCopyWithImpl(
      _$_RemoveFromWatchlistPressed _value,
      $Res Function(_$_RemoveFromWatchlistPressed) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieDetail = null,
  }) {
    return _then(_$_RemoveFromWatchlistPressed(
      null == movieDetail
          ? _value.movieDetail
          : movieDetail // ignore: cast_nullable_to_non_nullable
              as MovieDetail,
    ));
  }
}

/// @nodoc

class _$_RemoveFromWatchlistPressed implements _RemoveFromWatchlistPressed {
  const _$_RemoveFromWatchlistPressed(this.movieDetail);

  @override
  final MovieDetail movieDetail;

  @override
  String toString() {
    return 'MovieDetailEvent.removeFromWatchlistPressed(movieDetail: $movieDetail)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RemoveFromWatchlistPressed &&
            (identical(other.movieDetail, movieDetail) ||
                other.movieDetail == movieDetail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieDetail);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RemoveFromWatchlistPressedCopyWith<_$_RemoveFromWatchlistPressed>
      get copyWith => __$$_RemoveFromWatchlistPressedCopyWithImpl<
          _$_RemoveFromWatchlistPressed>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int id) movieDetailRequested,
    required TResult Function(int id) recommendationRequested,
    required TResult Function(int id) watchlistStatusRequested,
    required TResult Function(MovieDetail movieDetail) addToWatchlistPressed,
    required TResult Function(MovieDetail movieDetail)
        removeFromWatchlistPressed,
  }) {
    return removeFromWatchlistPressed(movieDetail);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int id)? movieDetailRequested,
    TResult? Function(int id)? recommendationRequested,
    TResult? Function(int id)? watchlistStatusRequested,
    TResult? Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult? Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
  }) {
    return removeFromWatchlistPressed?.call(movieDetail);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int id)? movieDetailRequested,
    TResult Function(int id)? recommendationRequested,
    TResult Function(int id)? watchlistStatusRequested,
    TResult Function(MovieDetail movieDetail)? addToWatchlistPressed,
    TResult Function(MovieDetail movieDetail)? removeFromWatchlistPressed,
    required TResult orElse(),
  }) {
    if (removeFromWatchlistPressed != null) {
      return removeFromWatchlistPressed(movieDetail);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_MovieDetailRequested value) movieDetailRequested,
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
    TResult? Function(_MovieDetailRequested value)? movieDetailRequested,
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
    TResult Function(_MovieDetailRequested value)? movieDetailRequested,
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

abstract class _RemoveFromWatchlistPressed implements MovieDetailEvent {
  const factory _RemoveFromWatchlistPressed(final MovieDetail movieDetail) =
      _$_RemoveFromWatchlistPressed;

  MovieDetail get movieDetail;
  @JsonKey(ignore: true)
  _$$_RemoveFromWatchlistPressedCopyWith<_$_RemoveFromWatchlistPressed>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MovieDetailState {
  MovieDetailFetchState get movieDetailFetchState =>
      throw _privateConstructorUsedError;
  RecommendationFetchState get recommendationFetchState =>
      throw _privateConstructorUsedError;
  WatchlistActionState get watchlistActionState =>
      throw _privateConstructorUsedError;
  bool get isAddedToWatchlist => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MovieDetailStateCopyWith<MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MovieDetailStateCopyWith<$Res> {
  factory $MovieDetailStateCopyWith(
          MovieDetailState value, $Res Function(MovieDetailState) then) =
      _$MovieDetailStateCopyWithImpl<$Res, MovieDetailState>;
  @useResult
  $Res call(
      {MovieDetailFetchState movieDetailFetchState,
      RecommendationFetchState recommendationFetchState,
      WatchlistActionState watchlistActionState,
      bool isAddedToWatchlist});

  $MovieDetailFetchStateCopyWith<$Res> get movieDetailFetchState;
  $RecommendationFetchStateCopyWith<$Res> get recommendationFetchState;
  $WatchlistActionStateCopyWith<$Res> get watchlistActionState;
}

/// @nodoc
class _$MovieDetailStateCopyWithImpl<$Res, $Val extends MovieDetailState>
    implements $MovieDetailStateCopyWith<$Res> {
  _$MovieDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieDetailFetchState = null,
    Object? recommendationFetchState = null,
    Object? watchlistActionState = null,
    Object? isAddedToWatchlist = null,
  }) {
    return _then(_value.copyWith(
      movieDetailFetchState: null == movieDetailFetchState
          ? _value.movieDetailFetchState
          : movieDetailFetchState // ignore: cast_nullable_to_non_nullable
              as MovieDetailFetchState,
      recommendationFetchState: null == recommendationFetchState
          ? _value.recommendationFetchState
          : recommendationFetchState // ignore: cast_nullable_to_non_nullable
              as RecommendationFetchState,
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
  $MovieDetailFetchStateCopyWith<$Res> get movieDetailFetchState {
    return $MovieDetailFetchStateCopyWith<$Res>(_value.movieDetailFetchState,
        (value) {
      return _then(_value.copyWith(movieDetailFetchState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RecommendationFetchStateCopyWith<$Res> get recommendationFetchState {
    return $RecommendationFetchStateCopyWith<$Res>(
        _value.recommendationFetchState, (value) {
      return _then(_value.copyWith(recommendationFetchState: value) as $Val);
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
abstract class _$$_MovieDetailStateCopyWith<$Res>
    implements $MovieDetailStateCopyWith<$Res> {
  factory _$$_MovieDetailStateCopyWith(
          _$_MovieDetailState value, $Res Function(_$_MovieDetailState) then) =
      __$$_MovieDetailStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MovieDetailFetchState movieDetailFetchState,
      RecommendationFetchState recommendationFetchState,
      WatchlistActionState watchlistActionState,
      bool isAddedToWatchlist});

  @override
  $MovieDetailFetchStateCopyWith<$Res> get movieDetailFetchState;
  @override
  $RecommendationFetchStateCopyWith<$Res> get recommendationFetchState;
  @override
  $WatchlistActionStateCopyWith<$Res> get watchlistActionState;
}

/// @nodoc
class __$$_MovieDetailStateCopyWithImpl<$Res>
    extends _$MovieDetailStateCopyWithImpl<$Res, _$_MovieDetailState>
    implements _$$_MovieDetailStateCopyWith<$Res> {
  __$$_MovieDetailStateCopyWithImpl(
      _$_MovieDetailState _value, $Res Function(_$_MovieDetailState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? movieDetailFetchState = null,
    Object? recommendationFetchState = null,
    Object? watchlistActionState = null,
    Object? isAddedToWatchlist = null,
  }) {
    return _then(_$_MovieDetailState(
      movieDetailFetchState: null == movieDetailFetchState
          ? _value.movieDetailFetchState
          : movieDetailFetchState // ignore: cast_nullable_to_non_nullable
              as MovieDetailFetchState,
      recommendationFetchState: null == recommendationFetchState
          ? _value.recommendationFetchState
          : recommendationFetchState // ignore: cast_nullable_to_non_nullable
              as RecommendationFetchState,
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

class _$_MovieDetailState implements _MovieDetailState {
  const _$_MovieDetailState(
      {required this.movieDetailFetchState,
      required this.recommendationFetchState,
      required this.watchlistActionState,
      required this.isAddedToWatchlist});

  @override
  final MovieDetailFetchState movieDetailFetchState;
  @override
  final RecommendationFetchState recommendationFetchState;
  @override
  final WatchlistActionState watchlistActionState;
  @override
  final bool isAddedToWatchlist;

  @override
  String toString() {
    return 'MovieDetailState(movieDetailFetchState: $movieDetailFetchState, recommendationFetchState: $recommendationFetchState, watchlistActionState: $watchlistActionState, isAddedToWatchlist: $isAddedToWatchlist)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MovieDetailState &&
            (identical(other.movieDetailFetchState, movieDetailFetchState) ||
                other.movieDetailFetchState == movieDetailFetchState) &&
            (identical(
                    other.recommendationFetchState, recommendationFetchState) ||
                other.recommendationFetchState == recommendationFetchState) &&
            (identical(other.watchlistActionState, watchlistActionState) ||
                other.watchlistActionState == watchlistActionState) &&
            (identical(other.isAddedToWatchlist, isAddedToWatchlist) ||
                other.isAddedToWatchlist == isAddedToWatchlist));
  }

  @override
  int get hashCode => Object.hash(runtimeType, movieDetailFetchState,
      recommendationFetchState, watchlistActionState, isAddedToWatchlist);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MovieDetailStateCopyWith<_$_MovieDetailState> get copyWith =>
      __$$_MovieDetailStateCopyWithImpl<_$_MovieDetailState>(this, _$identity);
}

abstract class _MovieDetailState implements MovieDetailState {
  const factory _MovieDetailState(
      {required final MovieDetailFetchState movieDetailFetchState,
      required final RecommendationFetchState recommendationFetchState,
      required final WatchlistActionState watchlistActionState,
      required final bool isAddedToWatchlist}) = _$_MovieDetailState;

  @override
  MovieDetailFetchState get movieDetailFetchState;
  @override
  RecommendationFetchState get recommendationFetchState;
  @override
  WatchlistActionState get watchlistActionState;
  @override
  bool get isAddedToWatchlist;
  @override
  @JsonKey(ignore: true)
  _$$_MovieDetailStateCopyWith<_$_MovieDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}
