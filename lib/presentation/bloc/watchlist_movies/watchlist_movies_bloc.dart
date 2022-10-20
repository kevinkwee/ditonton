import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_watchlist_movies.dart';
import '../data_getter/data_getter_bloc.dart';

class WatchlistMoviesBloc extends DataGetterBloc<List<Movie>, NoParam> {
  WatchlistMoviesBloc(this.getWatchlistMovies);

  final GetWatchlistMovies getWatchlistMovies;

  @override
  Future<Either<Failure, List<Movie>>> fetchData(NoParam params) {
    return getWatchlistMovies.execute();
  }
}
