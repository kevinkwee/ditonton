part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailState with _$MovieDetailState {
  const factory MovieDetailState({
    required MovieDetailFetchState movieDetailFetchState,
    required RecommendationFetchState recommendationFetchState,
    required WatchlistActionState watchlistActionState,
    required bool isAddedToWatchlist,
  }) = _MovieDetailState;

  factory MovieDetailState.initial() => const MovieDetailState(
        movieDetailFetchState: MovieDetailFetchState.initial(),
        recommendationFetchState: RecommendationFetchState.initial(),
        watchlistActionState: WatchlistActionState.initial(),
        isAddedToWatchlist: false,
      );
}
