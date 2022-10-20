import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../common/watchlist_action_state.dart';
import '../../../domain/entities/movie_detail.dart';
import '../../../domain/usecases/get_movie_detail.dart';
import '../../../domain/usecases/get_movie_recommendations.dart';
import '../../../domain/usecases/get_watchlist_status.dart';
import '../../../domain/usecases/remove_watchlist.dart';
import '../../../domain/usecases/save_watchlist.dart';
import 'movie_detail_fetch_state.dart';
import 'recommendation_fetch_state.dart';

part 'movie_detail_bloc.freezed.dart';
part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMovieDetail getMovieDetail;
  final GetMovieRecommendations getMovieRecommendations;
  final GetWatchListStatus getWatchListStatus;
  final SaveWatchlist saveWatchlist;
  final RemoveWatchlist removeWatchlist;

  MovieDetailBloc({
    required this.getMovieDetail,
    required this.getMovieRecommendations,
    required this.getWatchListStatus,
    required this.saveWatchlist,
    required this.removeWatchlist,
  }) : super(MovieDetailState.initial()) {
    on<MovieDetailEvent>((event, emit) async {
      await event.when(
        movieDetailRequested: (id) => _handleMovieDetailRequested(emit, id),
        recommendationRequested: (id) =>
            _handleRecommendationRequested(emit, id),
        watchlistStatusRequested: (id) =>
            _handleWatchlistStatusRequested(emit, id),
        addToWatchlistPressed: (movieDetail) =>
            _handleAddToWatchlistPressed(emit, movieDetail),
        removeFromWatchlistPressed: (movieDetail) =>
            _hanldeRemoveFromWatchlistPressed(emit, movieDetail),
      );
    });
  }

  Future<void> _handleMovieDetailRequested(
    Emitter<MovieDetailState> emit,
    int id,
  ) async {
    emit(state.copyWith(
      movieDetailFetchState: const MovieDetailFetchState.loadInProgress(),
    ));

    final result = await getMovieDetail.execute(id);

    result.fold(
      (failure) => emit(state.copyWith(
        movieDetailFetchState:
            MovieDetailFetchState.loadFailure(failure.message),
      )),
      (movieDetail) => emit(state.copyWith(
        movieDetailFetchState: MovieDetailFetchState.loadSuccess(movieDetail),
      )),
    );
  }

  Future<void> _handleRecommendationRequested(
    Emitter<MovieDetailState> emit,
    int id,
  ) async {
    emit(state.copyWith(
      recommendationFetchState: const RecommendationFetchState.loadInProgress(),
    ));

    final result = await getMovieRecommendations.execute(id);

    result.fold(
      (failure) => emit(state.copyWith(
        recommendationFetchState:
            RecommendationFetchState.loadFailure(failure.message),
      )),
      (recommendationList) => emit(state.copyWith(
        recommendationFetchState:
            RecommendationFetchState.loadSuccess(recommendationList),
      )),
    );
  }

  Future<void> _handleWatchlistStatusRequested(
    Emitter<MovieDetailState> emit,
    int id,
  ) async {
    final result = await getWatchListStatus.execute(id);

    emit(state.copyWith(
      isAddedToWatchlist: result,
    ));
  }

  Future<void> _handleAddToWatchlistPressed(
    Emitter<MovieDetailState> emit,
    MovieDetail movieDetail,
  ) async {
    emit(state.copyWith(
      watchlistActionState: const WatchlistActionState.actionInProgress(),
    ));

    final result = await saveWatchlist.execute(movieDetail);

    result.fold(
      (failure) => emit(state.copyWith(
          watchlistActionState:
              WatchlistActionState.actionFailure(failure.message))),
      (successMessage) => emit(state.copyWith(
          watchlistActionState:
              WatchlistActionState.actionSuccess(successMessage))),
    );
  }

  Future<void> _hanldeRemoveFromWatchlistPressed(
    Emitter<MovieDetailState> emit,
    MovieDetail movieDetail,
  ) async {
    emit(state.copyWith(
      watchlistActionState: const WatchlistActionState.actionInProgress(),
    ));

    final result = await removeWatchlist.execute(movieDetail);

    result.fold(
      (failure) => emit(state.copyWith(
          watchlistActionState:
              WatchlistActionState.actionFailure(failure.message))),
      (successMessage) => emit(state.copyWith(
          watchlistActionState:
              WatchlistActionState.actionSuccess(successMessage))),
    );
  }
}
