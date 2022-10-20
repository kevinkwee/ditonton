import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/get_top_rated_shows.dart';
import '../data_getter/data_getter_bloc.dart';

class TopRatedTelevisionBloc extends DataGetterBloc<List<Television>, NoParam> {
  TopRatedTelevisionBloc(this.getTopRatedShows);

  final GetTopRatedShows getTopRatedShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(NoParam params) {
    return getTopRatedShows();
  }
}
