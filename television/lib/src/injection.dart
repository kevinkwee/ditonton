import 'package:core/core.dart';

import 'data/datasources/db/television_database_helper.dart';
import 'data/datasources/television_local_data_source.dart';
import 'data/datasources/television_remote_data_source.dart';
import 'data/repositories/television_repository_impl.dart';
import 'domain/repositories/television_repository.dart';
import 'domain/usecases/get_on_the_air_shows.dart';
import 'domain/usecases/get_popular_shows.dart';
import 'domain/usecases/get_show_detail.dart';
import 'domain/usecases/get_show_recommendations.dart';
import 'domain/usecases/get_television_watchlist.dart';
import 'domain/usecases/get_television_watchlist_status.dart';
import 'domain/usecases/get_top_rated_shows.dart';
import 'domain/usecases/search_shows.dart';
import 'domain/usecases/television_delete_watchlist.dart';
import 'domain/usecases/television_save_watchlist.dart';
import 'presentation/bloc/on_the_air_television/on_the_air_television_bloc.dart';
import 'presentation/bloc/popular_television/popular_television_bloc.dart';
import 'presentation/bloc/television_detail/television_detail_bloc.dart';
import 'presentation/bloc/television_search/television_search_bloc.dart';
import 'presentation/bloc/top_rated_television/top_rated_television_bloc.dart';
import 'presentation/bloc/watchlist_televisions/watchlist_televisions_bloc.dart';

void init() {
  // bloc
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

  // usecase
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
  locator.registerLazySingleton<TelevisionRepository>(
    () => TelevisionRepositoryImpl(
      remoteDataSource: locator(),
      localDataSource: locator(),
    ),
  );

// datasource
  locator.registerLazySingleton<TelevisionRemoteDataSource>(
      () => TelevisionRemoteDataSourceImpl(client: locator()));
  locator.registerLazySingleton<TelevisionLocalDataSource>(
      () => TelevisionLocalDataSourceImpl(databaseHelper: locator()));

  // helper
  locator.registerLazySingleton<TelevisionDatabaseHelper>(
    () => TelevisionDatabaseHelper(),
  );
}
