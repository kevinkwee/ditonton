import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';

import 'common/utils.dart';
import 'data/datasources/db/database_helper.dart';
import 'data/datasources/db/television_database_helper.dart';
import 'data/datasources/movie_local_data_source.dart';
import 'data/datasources/movie_remote_data_source.dart';
import 'data/datasources/television_local_data_source.dart';
import 'data/datasources/television_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'data/repositories/television_repository_impl.dart';
import 'domain/repositories/movie_repository.dart';
import 'domain/repositories/television_repository.dart';
import 'domain/usecases/get_movie_detail.dart';
import 'domain/usecases/get_movie_recommendations.dart';
import 'domain/usecases/get_now_playing_movies.dart';
import 'domain/usecases/get_popular_movies.dart';
import 'domain/usecases/get_top_rated_movies.dart';
import 'domain/usecases/get_watchlist_movies.dart';
import 'domain/usecases/get_watchlist_status.dart';
import 'domain/usecases/remove_watchlist.dart';
import 'domain/usecases/save_watchlist.dart';
import 'domain/usecases/search_movies.dart';
import 'domain/usecases/television/get_on_the_air_shows.dart';
import 'domain/usecases/television/get_popular_shows.dart';
import 'domain/usecases/television/get_show_detail.dart';
import 'domain/usecases/television/get_show_recommendations.dart';
import 'domain/usecases/television/get_television_watchlist.dart';
import 'domain/usecases/television/get_television_watchlist_status.dart';
import 'domain/usecases/television/get_top_rated_shows.dart';
import 'domain/usecases/television/search_shows.dart';
import 'domain/usecases/television/television_delete_watchlist.dart';
import 'domain/usecases/television/television_save_watchlist.dart';
import 'presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'presentation/bloc/movie_search/movie_search_bloc.dart';
import 'presentation/bloc/now_playing_movies/now_playing_movies_bloc.dart';
import 'presentation/bloc/on_the_air_television/on_the_air_television_bloc.dart';
import 'presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'presentation/bloc/popular_television/popular_television_bloc.dart';
import 'presentation/bloc/television_detail/television_detail_bloc.dart';
import 'presentation/bloc/television_search/television_search_bloc.dart';
import 'presentation/bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'presentation/bloc/top_rated_television/top_rated_television_bloc.dart';
import 'presentation/bloc/watchlist_movies/watchlist_movies_bloc.dart';
import 'presentation/bloc/watchlist_televisions/watchlist_televisions_bloc.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(() => NowPlayingMoviesBloc(locator()));
  locator.registerFactory(() => TopRatedMoviesBloc(locator()));
  locator.registerFactory(() => PopularMoviesBloc(locator()));
  locator.registerFactory(() => WatchlistMoviesBloc(locator()));
  locator.registerFactory(() => MovieSearchBloc(locator()));
  locator.registerFactory(() => MovieDetailBloc(
        getMovieDetail: locator(),
        getMovieRecommendations: locator(),
        getWatchListStatus: locator(),
        saveWatchlist: locator(),
        removeWatchlist: locator(),
      ));
  locator.registerFactory(() => OnTheAirTelevisionBloc(locator()));
  locator.registerFactory(() => TopRatedTelevisionBloc(locator()));
  locator.registerFactory(() => PopularTelevisionBloc(locator()));
  locator.registerFactory(() => WatchlistTelevisionsBloc(locator()));
  locator.registerFactory(() => TelevisionSearchBloc(locator()));
  locator.registerFactory(() => TelevisionDetailBloc(
        getShowDetail: locator(),
        getShowRecommendations: locator(),
        getTelevisionWatchlistStatus: locator(),
        televisionSaveWatchlist: locator(),
        televisionDeleteWatchlist: locator(),
      ));

  // use case
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListStatus(locator()));
  locator.registerLazySingleton(() => SaveWatchlist(locator()));
  locator.registerLazySingleton(() => RemoveWatchlist(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => GetOnTheAirShows(locator()));
  locator.registerLazySingleton(() => GetPopularShows(locator()));
  locator.registerLazySingleton(() => GetTopRatedShows(locator()));
  locator.registerLazySingleton(() => SearchShows(locator()));
  locator.registerLazySingleton(() => GetShowDetail(locator()));
  locator.registerLazySingleton(() => GetShowRecommendations(locator()));
  locator.registerLazySingleton(() => GetTelevisionWatchlistStatus(locator()));
  locator.registerLazySingleton(() => TelevisionSaveWatchlist(locator()));
  locator.registerLazySingleton(() => TelevisionDeleteWatchlist(locator()));
  locator.registerLazySingleton(() => GetTelevisionWatchlist(locator()));

  // repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );
  locator.registerLazySingleton<TelevisionRepository>(
    () => TelevisionRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<MovieLocalDataSource>(
      () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  locator.registerLazySingleton<TelevisionRemoteDataSource>(
      () => TelevisionRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TelevisionLocalDataSource>(
      () => TelevisionLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());
  locator.registerLazySingleton<TelevisionDatabaseHelper>(
    () => TelevisionDatabaseHelper(),
  );

  // external
  locator.registerSingletonAsync<http.Client>(
    () async => IOClient(
      HttpClient(context: await getGlobalSecurityContext()),
    ),
  );
}
