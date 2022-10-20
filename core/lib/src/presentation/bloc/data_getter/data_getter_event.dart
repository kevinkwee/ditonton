part of 'data_getter_bloc.dart';

@freezed
class DataGetterEvent<P> with _$DataGetterEvent {
  factory DataGetterEvent.requested(P params) = _Requested;
}
