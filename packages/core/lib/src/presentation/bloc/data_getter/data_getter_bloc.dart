import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../failure.dart';

part 'data_getter_bloc.freezed.dart';
part 'data_getter_event.dart';
part 'data_getter_state.dart';

abstract class DataGetterBloc<T, P>
    extends Bloc<DataGetterEvent<P>, DataGetterState<T>> {
  DataGetterBloc() : super(DataGetterState<T>.initial()) {
    on<DataGetterEvent<P>>((event, emit) async {
      emit(DataGetterState<T>.loadInProgress());

      final result = await fetchData(event.params);

      result.fold(
        (failure) => emit(DataGetterState<T>.loadFailure(failure.message)),
        (data) => emit(DataGetterState<T>.loadSuccess(data)),
      );
    });
  }

  Future<Either<Failure, T>> fetchData(P params);
}

class NoParam {}
