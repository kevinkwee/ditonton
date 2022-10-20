import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/television_detail.dart';

part 'television_detail_fetch_state.freezed.dart';

@freezed
class TelevisionDetailFetchState with _$TelevisionDetailFetchState {
  const factory TelevisionDetailFetchState.initial() = _Initial;
  const factory TelevisionDetailFetchState.loadInProgress() = _LoadInProgress;
  const factory TelevisionDetailFetchState.loadSuccess(
      TelevisionDetail televisionDetail) = _LoadSuccess;
  const factory TelevisionDetailFetchState.loadFailure(String message) =
      _LoadFailure;
}
