import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/src/domain/entities/movie.dart';
import 'package:movie/src/domain/usecases/get_popular_movies.dart';
import 'package:movie/src/presentation/bloc/popular_movies/popular_movies_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_movies_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetPopularMovies>(),
])
void main() {
  late PopularMoviesBloc bloc;
  late MockGetPopularMovies mockGetPopularMovies;

  setUp(() {
    mockGetPopularMovies = MockGetPopularMovies();
    bloc = PopularMoviesBloc(mockGetPopularMovies);
  });

  void setUpMockGetPopularMoviesSuccess() {
    when(mockGetPopularMovies.execute())
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
    verify: (bloc) => verify(mockGetPopularMovies.execute()),
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
    setUp: () => when(mockGetPopularMovies.execute())
        .thenAnswer((_) async => left(const ServerFailure(''))),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<Movie>>.loadInProgress(),
      const DataGetterState<List<Movie>>.loadFailure(''),
    ],
  );
}
