import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/entities/television.dart';
import 'package:television/src/domain/usecases/get_top_rated_shows.dart';
import 'package:television/src/presentation/bloc/top_rated_television/top_rated_television_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'top_rated_television_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetTopRatedShows>(),
])
void main() {
  late TopRatedTelevisionBloc bloc;
  late MockGetTopRatedShows mockGetTopRatedShows;

  setUp(() {
    mockGetTopRatedShows = MockGetTopRatedShows();
    bloc = TopRatedTelevisionBloc(mockGetTopRatedShows);
  });

  void setUpMockGetTopRatedShowsSuccess() {
    when(mockGetTopRatedShows())
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
    setUp: () => setUpMockGetTopRatedShowsSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    verify: (bloc) => verify(mockGetTopRatedShows()),
  );

  blocTest(
    'should emit [loadInProgress, loadSuccess] when data is gotten successfully',
    build: () => bloc,
    setUp: () => setUpMockGetTopRatedShowsSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<Television>>.loadInProgress(),
      const DataGetterState<List<Television>>.loadSuccess(testTelevisionList),
    ],
  );

  blocTest(
    'should emit [loadInProgress, loadFailure] when getting data is failed',
    build: () => bloc,
    setUp: () => when(mockGetTopRatedShows())
        .thenAnswer((_) async => left(const ServerFailure(''))),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<Television>>.loadInProgress(),
      const DataGetterState<List<Television>>.loadFailure(''),
    ],
  );
}
