import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_now_playing_movies.dart';

class NowPlayingMoviesBloc extends DataGetterBloc<List<Movie>, NoParam> {
  NowPlayingMoviesBloc(this.getNowPlayingMovies);

  final GetNowPlayingMovies getNowPlayingMovies;

  @override
  Future<Either<Failure, List<Movie>>> fetchData(NoParam params) {
    return getNowPlayingMovies.execute();
  }
}
