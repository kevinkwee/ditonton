import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_top_rated_movies.dart';
import '../data_getter/data_getter_bloc.dart';

class TopRatedMoviesBloc extends DataGetterBloc<List<Movie>, NoParam> {
  TopRatedMoviesBloc(this.getTopRatedMovies);

  final GetTopRatedMovies getTopRatedMovies;

  @override
  Future<Either<Failure, List<Movie>>> fetchData(NoParam params) {
    return getTopRatedMovies.execute();
  }
}
