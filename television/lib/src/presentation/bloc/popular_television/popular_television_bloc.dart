import 'package:core/core.dart' show DataGetterBloc, Failure, NoParam;
import 'package:dartz/dartz.dart';

import '../../../domain/entities/television.dart';
import '../../../domain/usecases/get_popular_shows.dart';

class PopularTelevisionBloc extends DataGetterBloc<List<Television>, NoParam> {
  PopularTelevisionBloc(this.getPopularShows);

  final GetPopularShows getPopularShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(NoParam params) {
    return getPopularShows();
  }
}
