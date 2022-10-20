import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/get_popular_shows.dart';
import '../data_getter/data_getter_bloc.dart';

class PopularTelevisionBloc extends DataGetterBloc<List<Television>, NoParam> {
  PopularTelevisionBloc(this.getPopularShows);

  final GetPopularShows getPopularShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(NoParam params) {
    return getPopularShows();
  }
}
