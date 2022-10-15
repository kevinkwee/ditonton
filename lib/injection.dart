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
import 'presentation/provider/movie_detail_notifier.dart';
import 'presentation/provider/movie_list_notifier.dart';
import 'presentation/provider/movie_search_notifier.dart';
import 'presentation/provider/popular_movies_notifier.dart';
import 'presentation/provider/television/on_the_air_shows_notifier.dart';
import 'presentation/provider/television/popular_shows_notifier.dart';
import 'presentation/provider/television/show_detail_notifier.dart';
import 'presentation/provider/television/show_search_notifier.dart';
import 'presentation/provider/television/top_rated_shows_notifier.dart';
import 'presentation/provider/television/watchlist_show_notifier.dart';
import 'presentation/provider/top_rated_movies_notifier.dart';
import 'presentation/provider/watchlist_movie_notifier.dart';

final locator = GetIt.instance;

void init() {
  // provider
  locator.registerFactory(
    () => MovieListNotifier(
      getNowPlayingMovies: locator(),
      getPopularMovies: locator(),
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieDetailNotifier(
      getMovieDetail: locator(),
      getMovieRecommendations: locator(),
      getWatchListStatus: locator(),
      saveWatchlist: locator(),
      removeWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => MovieSearchNotifier(
      searchMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => PopularMoviesNotifier(
      locator(),
    ),
  );
  locator.registerFactory(
    () => TopRatedMoviesNotifier(
      getTopRatedMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistMovieNotifier(
      getWatchlistMovies: locator(),
    ),
  );
  locator.registerFactory(
    () => OnTheAirShowsNotifier(locator()),
  );
  locator.registerFactory(
    () => PopularShowsNotifier(locator()),
  );
  locator.registerFactory(
    () => TopRatedShowsNotifier(locator()),
  );
  locator.registerFactory(
    () => ShowSearchNotifier(locator()),
  );
  locator.registerFactory(
    () => ShowDetailNotifier(
      getShowDetail: locator(),
      getShowRecommendations: locator(),
      getTelevisionWatchlistStatus: locator(),
      televisionSaveWatchlist: locator(),
      televisionDeleteWatchlist: locator(),
    ),
  );
  locator.registerFactory(
    () => WatchlistShowNotifier(locator()),
  );

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
