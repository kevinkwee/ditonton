part of 'television_detail_bloc.dart';

@freezed
class TelevisionDetailState with _$TelevisionDetailState {
  const factory TelevisionDetailState({
    required TelevisionDetailFetchState televisionDetailFetchState,
    required TvRecommendationFetchState tvRecommendationFetchState,
    required WatchlistActionState watchlistActionState,
    required bool isAddedToWatchlist,
  }) = _TelevisionDetailState;

  factory TelevisionDetailState.initial() => const TelevisionDetailState(
        televisionDetailFetchState: TelevisionDetailFetchState.initial(),
        tvRecommendationFetchState: TvRecommendationFetchState.initial(),
        watchlistActionState: WatchlistActionState.initial(),
        isAddedToWatchlist: false,
      );
}
