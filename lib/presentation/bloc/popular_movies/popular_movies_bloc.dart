import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_popular_movies.dart';
import '../data_getter/data_getter_bloc.dart';

class PopularMoviesBloc extends DataGetterBloc<List<Movie>, NoParam> {
  PopularMoviesBloc(this.getPopularMovies);

  final GetPopularMovies getPopularMovies;

  @override
  Future<Either<Failure, List<Movie>>> fetchData(NoParam params) {
    return getPopularMovies.execute();
  }
}
