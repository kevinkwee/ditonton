part of 'data_getter_bloc.dart';

@freezed
class DataGetterState<T> with _$DataGetterState<T> {
  const factory DataGetterState.initial() = _Initial;
  const factory DataGetterState.loadInProgress() = _LoadInProgress;
  const factory DataGetterState.loadSuccess(T data) = _LoadSuccess;
  const factory DataGetterState.loadFailure(String message) = _LoadFailure;
}
