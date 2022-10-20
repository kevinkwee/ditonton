import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/get_now_playing_movies.dart';
import '../data_getter/data_getter_bloc.dart';

class NowPlayingMoviesBloc extends DataGetterBloc<List<Movie>, NoParam> {
  NowPlayingMoviesBloc(this.getNowPlayingMovies);

  final GetNowPlayingMovies getNowPlayingMovies;

  @override
  Future<Either<Failure, List<Movie>>> fetchData(NoParam params) {
    return getNowPlayingMovies.execute();
  }
}
