import 'package:freezed_annotation/freezed_annotation.dart';

part 'watchlist_action_state.freezed.dart';

@freezed
class WatchlistActionState with _$WatchlistActionState {
  const factory WatchlistActionState.initial() = _Initial;
  const factory WatchlistActionState.actionInProgress() = _ActionInProgress;
  const factory WatchlistActionState.actionSuccess(String message) =
      _ActionSuccess;
  const factory WatchlistActionState.actionFailure(String message) =
      _ActionFailure;
}
