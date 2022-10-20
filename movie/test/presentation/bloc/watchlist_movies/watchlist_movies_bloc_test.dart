import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/src/domain/entities/movie.dart';
import 'package:movie/src/domain/usecases/get_watchlist_movies.dart';
import 'package:movie/src/presentation/bloc/watchlist_movies/watchlist_movies_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_movies_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetWatchlistMovies>(),
])
void main() {
  late WatchlistMoviesBloc bloc;
  late MockGetWatchlistMovies mockGetWatchlistMovies;

  setUp(() {
    mockGetWatchlistMovies = MockGetWatchlistMovies();
    bloc = WatchlistMoviesBloc(mockGetWatchlistMovies);
  });

  void setUpMockGetPopularMoviesSuccess() {
    when(mockGetWatchlistMovies.execute())
        .thenAnswer((_) async => right(testMovieList));
  }

  tearDown(() async {
    await bloc.close();
  });

  test(
    'should has an [initial] state on initial',
    () {
      expect(bloc.state, const DataGetterState<List<Movie>>.initial());
    },
  );

  blocTest(
    'should call the concrete usecase to get data',
    build: () => bloc,
    setUp: () => setUpMockGetPopularMoviesSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    verify: (bloc) => verify(mockGetWatchlistMovies.execute()),
  );

  blocTest(
    'should emit [loadInProgress, loadSuccess] when data is gotten successfully',
    build: () => bloc,
    setUp: () => setUpMockGetPopularMoviesSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<Movie>>.loadInProgress(),
      DataGetterState<List<Movie>>.loadSuccess(testMovieList),
    ],
  );

  blocTest(
    'should emit [loadInProgress, loadFailure] when getting data is failed',
    build: () => bloc,
    setUp: () => when(mockGetWatchlistMovies.execute())
        .thenAnswer((_) async => left(const DatabaseFailure('Failed'))),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<Movie>>.loadInProgress(),
      const DataGetterState<List<Movie>>.loadFailure('Failed'),
    ],
  );
}
