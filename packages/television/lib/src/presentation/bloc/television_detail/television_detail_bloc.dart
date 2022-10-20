import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/television_detail.dart';
import '../../../domain/usecases/get_show_detail.dart';
import '../../../domain/usecases/get_show_recommendations.dart';
import '../../../domain/usecases/get_television_watchlist_status.dart';
import '../../../domain/usecases/television_delete_watchlist.dart';
import '../../../domain/usecases/television_save_watchlist.dart';
import 'television_detail_fetch_state.dart';
import 'tv_recommendation_fetch_state.dart';

part 'television_detail_bloc.freezed.dart';
part 'television_detail_event.dart';
part 'television_detail_state.dart';

class TelevisionDetailBloc
    extends Bloc<TelevisionDetailEvent, TelevisionDetailState> {
  final GetShowDetail getShowDetail;
  final GetShowRecommendations getShowRecommendations;
  final GetTelevisionWatchlistStatus getTelevisionWatchlistStatus;
  final TelevisionSaveWatchlist televisionSaveWatchlist;
  final TelevisionDeleteWatchlist televisionDeleteWatchlist;

  TelevisionDetailBloc({
    required this.getShowDetail,
    required this.getShowRecommendations,
    required this.getTelevisionWatchlistStatus,
    required this.televisionSaveWatchlist,
    required this.televisionDeleteWatchlist,
  }) : super(TelevisionDetailState.initial()) {
    on<TelevisionDetailEvent>((event, emit) async {
      await event.when(
        televisionDetailRequested: (id) =>
            _handleTelevisionDetailRequested(emit, id),
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

  Future<void> _handleTelevisionDetailRequested(
    Emitter<TelevisionDetailState> emit,
    int id,
  ) async {
    emit(state.copyWith(
      televisionDetailFetchState:
          const TelevisionDetailFetchState.loadInProgress(),
    ));

    final result = await getShowDetail(id);

    result.fold(
      (failure) => emit(state.copyWith(
        televisionDetailFetchState:
            TelevisionDetailFetchState.loadFailure(failure.message),
      )),
      (televisionDetail) => emit(state.copyWith(
        televisionDetailFetchState:
            TelevisionDetailFetchState.loadSuccess(televisionDetail),
      )),
    );
  }

  Future<void> _handleRecommendationRequested(
    Emitter<TelevisionDetailState> emit,
    int id,
  ) async {
    emit(state.copyWith(
      tvRecommendationFetchState:
          const TvRecommendationFetchState.loadInProgress(),
    ));

    final result = await getShowRecommendations(id);

    result.fold(
      (failure) => emit(state.copyWith(
        tvRecommendationFetchState:
            TvRecommendationFetchState.loadFailure(failure.message),
      )),
      (recommendationList) => emit(state.copyWith(
        tvRecommendationFetchState:
            TvRecommendationFetchState.loadSuccess(recommendationList),
      )),
    );
  }

  Future<void> _handleWatchlistStatusRequested(
    Emitter<TelevisionDetailState> emit,
    int id,
  ) async {
    final result = await getTelevisionWatchlistStatus(id);

    emit(state.copyWith(
      isAddedToWatchlist: result,
    ));
  }

  Future<void> _handleAddToWatchlistPressed(
    Emitter<TelevisionDetailState> emit,
    TelevisionDetail televisionDetail,
  ) async {
    emit(state.copyWith(
      watchlistActionState: const WatchlistActionState.actionInProgress(),
    ));

    final result = await televisionSaveWatchlist(televisionDetail);

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
    Emitter<TelevisionDetailState> emit,
    TelevisionDetail televisionDetail,
  ) async {
    emit(state.copyWith(
      watchlistActionState: const WatchlistActionState.actionInProgress(),
    ));

    final result = await televisionDeleteWatchlist(televisionDetail);

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
