import 'package:core/core.dart' show DataGetterBloc, Failure;
import 'package:dartz/dartz.dart';

import '../../../domain/entities/television.dart';
import '../../../domain/usecases/search_shows.dart';

class TelevisionSearchBloc extends DataGetterBloc<List<Television>, String> {
  TelevisionSearchBloc(this.searchShows);

  final SearchShows searchShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(String params) {
    return searchShows(params);
  }
}
