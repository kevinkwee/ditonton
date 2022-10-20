import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/usecases/search_movies.dart';
import 'package:ditonton/presentation/bloc/data_getter/data_getter_bloc.dart';
import 'package:ditonton/presentation/bloc/movie_search/movie_search_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_search_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SearchMovies>(),
])
void main() {
  late MovieSearchBloc bloc;
  late MockSearchMovies mockSearchMovies;

  const testQuery = 'test';

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    bloc = MovieSearchBloc(mockSearchMovies);
  });

  void setUpMockGetPopularMoviesSuccess() {
    when(mockSearchMovies.execute(any))
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
    act: (bloc) => bloc.add(DataGetterEvent.requested(testQuery)),
    verify: (bloc) => verify(mockSearchMovies.execute(testQuery)),
  );

  blocTest(
    'should emit [loadInProgress, loadSuccess] when data is gotten successfully',
    build: () => bloc,
    setUp: () => setUpMockGetPopularMoviesSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(testQuery)),
    expect: () => [
      const DataGetterState<List<Movie>>.loadInProgress(),
      DataGetterState<List<Movie>>.loadSuccess(testMovieList),
    ],
  );

  blocTest(
    'should emit [loadInProgress, loadFailure] when getting data is failed',
    build: () => bloc,
    setUp: () => when(mockSearchMovies.execute(any))
        .thenAnswer((_) async => left(const ServerFailure(''))),
    act: (bloc) => bloc.add(DataGetterEvent.requested(testQuery)),
    expect: () => [
      const DataGetterState<List<Movie>>.loadInProgress(),
      const DataGetterState<List<Movie>>.loadFailure(''),
    ],
  );
}
