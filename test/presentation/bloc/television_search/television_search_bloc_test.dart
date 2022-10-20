import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/television.dart';
import 'package:ditonton/domain/usecases/television/search_shows.dart';
import 'package:ditonton/presentation/bloc/data_getter/data_getter_bloc.dart';
import 'package:ditonton/presentation/bloc/television_search/television_search_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'television_search_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SearchShows>(),
])
void main() {
  late TelevisionSearchBloc bloc;
  late MockSearchShows mockSearchShows;

  const testQuery = 'test';

  setUp(() {
    mockSearchShows = MockSearchShows();
    bloc = TelevisionSearchBloc(mockSearchShows);
  });

  void setUpMockSearchShowsSuccess() {
    when(mockSearchShows(testQuery))
        .thenAnswer((_) async => right(testTelevisionList));
  }

  tearDown(() async {
    await bloc.close();
  });

  test(
    'should has an [initial] state on initial',
    () {
      expect(bloc.state, const DataGetterState<List<Television>>.initial());
    },
  );

  blocTest(
    'should call the concrete usecase to get data',
    build: () => bloc,
    setUp: () => setUpMockSearchShowsSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(testQuery)),
    verify: (bloc) => verify(mockSearchShows(testQuery)),
  );

  blocTest(
    'should emit [loadInProgress, loadSuccess] when data is gotten successfully',
    build: () => bloc,
    setUp: () => setUpMockSearchShowsSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(testQuery)),
    expect: () => [
      const DataGetterState<List<Television>>.loadInProgress(),
      const DataGetterState<List<Television>>.loadSuccess(testTelevisionList),
    ],
  );

  blocTest(
    'should emit [loadInProgress, loadFailure] when getting data is failed',
    build: () => bloc,
    setUp: () => when(mockSearchShows(testQuery))
        .thenAnswer((_) async => left(const ServerFailure(''))),
    act: (bloc) => bloc.add(DataGetterEvent.requested(testQuery)),
    expect: () => [
      const DataGetterState<List<Television>>.loadInProgress(),
      const DataGetterState<List<Television>>.loadFailure(''),
    ],
  );
}
