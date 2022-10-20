part of 'movie_detail_bloc.dart';

@freezed
class MovieDetailEvent with _$MovieDetailEvent {
  const factory MovieDetailEvent.movieDetailRequested(int id) =
      _MovieDetailRequested;
  const factory MovieDetailEvent.recommendationRequested(int id) =
      _RecommendationRequested;
  const factory MovieDetailEvent.watchlistStatusRequested(int id) =
      _WatchlistStatusRequested;
  const factory MovieDetailEvent.addToWatchlistPressed(
    MovieDetail movieDetail,
  ) = _AddToWatchlistPressed;
  const factory MovieDetailEvent.removeFromWatchlistPressed(
    MovieDetail movieDetail,
  ) = _RemoveFromWatchlistPressed;
}
