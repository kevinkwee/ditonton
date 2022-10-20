import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie_detail.dart';

part 'movie_detail_fetch_state.freezed.dart';

@freezed
class MovieDetailFetchState with _$MovieDetailFetchState {
  const factory MovieDetailFetchState.initial() = _Initial;
  const factory MovieDetailFetchState.loadInProgress() = _LoadInProgress;
  const factory MovieDetailFetchState.loadSuccess(MovieDetail movieDetail) =
      _LoadSuccess;
  const factory MovieDetailFetchState.loadFailure(String message) =
      _LoadFailure;
}
