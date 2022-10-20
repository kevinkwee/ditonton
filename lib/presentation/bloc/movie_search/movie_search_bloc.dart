import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/search_movies.dart';
import '../data_getter/data_getter_bloc.dart';

class MovieSearchBloc extends DataGetterBloc<List<Movie>, String> {
  MovieSearchBloc(this.searchMovies);

  final SearchMovies searchMovies;

  @override
  Future<Either<Failure, List<Movie>>> fetchData(String params) {
    return searchMovies.execute(params);
  }
}
