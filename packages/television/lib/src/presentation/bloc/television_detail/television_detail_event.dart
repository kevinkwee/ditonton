part of 'television_detail_bloc.dart';

@freezed
class TelevisionDetailEvent with _$TelevisionDetailEvent {
  const factory TelevisionDetailEvent.televisionDetailRequested(int id) =
      _TelevisionDetailRequested;
  const factory TelevisionDetailEvent.recommendationRequested(int id) =
      _RecommendationRequested;
  const factory TelevisionDetailEvent.watchlistStatusRequested(int id) =
      _WatchlistStatusRequested;
  const factory TelevisionDetailEvent.addToWatchlistPressed(
    TelevisionDetail televisionDetail,
  ) = _AddToWatchlistPressed;
  const factory TelevisionDetailEvent.removeFromWatchlistPressed(
    TelevisionDetail televisionDetail,
  ) = _RemoveFromWatchlistPressed;
}
