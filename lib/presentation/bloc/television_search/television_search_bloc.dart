import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/search_shows.dart';
import '../data_getter/data_getter_bloc.dart';

class TelevisionSearchBloc extends DataGetterBloc<List<Television>, String> {
  TelevisionSearchBloc(this.searchShows);

  final SearchShows searchShows;

  @override
  Future<Either<Failure, List<Television>>> fetchData(String params) {
    return searchShows(params);
  }
}
