import 'package:core/core.dart' show DataGetterBloc, Failure, NoParam;
import 'package:dartz/dartz.dart';

import '../../../domain/entities/television.dart';
import '../../../domain/usecases/get_top_rated_shows.dart';

class TopRatedTelevisionBloc extends DataGetterBloc<List<Television>, NoParam> {
  TopRatedTelevisionBloc(this.getTopRatedShows);

  final GetTopRatedShows getTopRatedShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(NoParam params) {
    return getTopRatedShows();
  }
}
