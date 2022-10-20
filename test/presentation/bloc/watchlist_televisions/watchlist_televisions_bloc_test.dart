import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/domain/entities/television_watchlist.dart';
import 'package:ditonton/domain/usecases/television/get_television_watchlist.dart';
import 'package:ditonton/presentation/bloc/data_getter/data_getter_bloc.dart';
import 'package:ditonton/presentation/bloc/watchlist_televisions/watchlist_televisions_bloc.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_televisions_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetTelevisionWatchlist>(),
])
void main() {
  late WatchlistTelevisionsBloc bloc;
  late MockGetTelevisionWatchlist mockGetTelevisionWatchlist;

  setUp(() {
    mockGetTelevisionWatchlist = MockGetTelevisionWatchlist();
    bloc = WatchlistTelevisionsBloc(mockGetTelevisionWatchlist);
  });

  void setUpMockGetTelevisionWatchlistSuccess() {
    when(mockGetTelevisionWatchlist())
        .thenAnswer((_) async => right([testTelevisionWatchlist]));
  }

  tearDown(() async {
    await bloc.close();
  });

  test(
    'should has an [initial] state on initial',
    () {
      expect(bloc.state,
          const DataGetterState<List<TelevisionWatchlist>>.initial());
    },
  );

  blocTest(
    'should call the concrete usecase to get data',
    build: () => bloc,
    setUp: () => setUpMockGetTelevisionWatchlistSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    verify: (bloc) => verify(mockGetTelevisionWatchlist()),
  );

  blocTest(
    'should emit [loadInProgress, loadSuccess] when data is gotten successfully',
    build: () => bloc,
    setUp: () => setUpMockGetTelevisionWatchlistSuccess(),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<TelevisionWatchlist>>.loadInProgress(),
      const DataGetterState<List<TelevisionWatchlist>>.loadSuccess(
          [testTelevisionWatchlist]),
    ],
  );

  blocTest(
    'should emit [loadInProgress, loadFailure] when getting data is failed',
    build: () => bloc,
    setUp: () => when(mockGetTelevisionWatchlist())
        .thenAnswer((_) async => left(const DatabaseFailure('Failed'))),
    act: (bloc) => bloc.add(DataGetterEvent.requested(NoParam())),
    expect: () => [
      const DataGetterState<List<TelevisionWatchlist>>.loadInProgress(),
      const DataGetterState<List<TelevisionWatchlist>>.loadFailure('Failed'),
    ],
  );
}
