import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/movie.dart';

part 'recommendation_fetch_state.freezed.dart';

@freezed
class RecommendationFetchState with _$RecommendationFetchState {
  const factory RecommendationFetchState.initial() = _Initial;
  const factory RecommendationFetchState.loadInProgress() = _LoadInProgress;
  const factory RecommendationFetchState.loadSuccess(
      List<Movie> recommendationList) = _LoadSuccess;
  const factory RecommendationFetchState.loadFailure(String message) =
      _LoadFailure;
}
