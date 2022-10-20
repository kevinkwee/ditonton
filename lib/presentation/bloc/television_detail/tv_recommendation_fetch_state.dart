import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/television.dart';

part 'tv_recommendation_fetch_state.freezed.dart';

@freezed
class TvRecommendationFetchState with _$TvRecommendationFetchState {
  const factory TvRecommendationFetchState.initial() = _Initial;
  const factory TvRecommendationFetchState.loadInProgress() = _LoadInProgress;
  const factory TvRecommendationFetchState.loadSuccess(
      List<Television> recommendationList) = _LoadSuccess;
  const factory TvRecommendationFetchState.loadFailure(String message) =
      _LoadFailure;
}
