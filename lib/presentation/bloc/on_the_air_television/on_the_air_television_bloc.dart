import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/get_on_the_air_shows.dart';
import '../data_getter/data_getter_bloc.dart';

class OnTheAirTelevisionBloc extends DataGetterBloc<List<Television>, NoParam> {
  OnTheAirTelevisionBloc(this.getOnTheAirShows);

  final GetOnTheAirShows getOnTheAirShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(NoParam params) {
    return getOnTheAirShows();
  }
}
