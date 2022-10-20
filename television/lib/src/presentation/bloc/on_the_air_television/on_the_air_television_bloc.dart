import 'package:core/core.dart' show DataGetterBloc, Failure, NoParam;
import 'package:dartz/dartz.dart';

import '../../../domain/entities/television.dart';
import '../../../domain/usecases/get_on_the_air_shows.dart';

class OnTheAirTelevisionBloc extends DataGetterBloc<List<Television>, NoParam> {
  OnTheAirTelevisionBloc(this.getOnTheAirShows);

  final GetOnTheAirShows getOnTheAirShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(NoParam params) {
    return getOnTheAirShows();
  }
}
