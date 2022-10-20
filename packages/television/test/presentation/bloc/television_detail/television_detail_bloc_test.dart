import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/get_show_detail.dart';
import 'package:television/src/domain/usecases/get_show_recommendations.dart';
import 'package:television/src/domain/usecases/get_television_watchlist_status.dart';
import 'package:television/src/domain/usecases/television_delete_watchlist.dart';
import 'package:television/src/domain/usecases/television_save_watchlist.dart';
import 'package:television/src/presentation/bloc/television_detail/television_detail_bloc.dart';
import 'package:television/src/presentation/bloc/television_detail/television_detail_fetch_state.dart';
import 'package:television/src/presentation/bloc/television_detail/tv_recommendation_fetch_state.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'television_detail_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetShowDetail>(),
  MockSpec<GetShowRecommendations>(),
  MockSpec<GetTelevisionWatchlistStatus>(),
  MockSpec<TelevisionSaveWatchlist>(),
  MockSpec<TelevisionDeleteWatchlist>(),
])
void main() {
  late TelevisionDetailBloc bloc;
  late MockGetShowDetail mockGetShowDetail;
  late MockGetShowRecommendations mockGetShowRecommendations;
  late MockGetTelevisionWatchlistStatus mockGetTelevisionWatchListStatus;
  late MockTelevisionSaveWatchlist mockTelevisionSaveWatchlist;
  late MockTelevisionDeleteWatchlist mockTelevisionDeleteWatchlist;

  const testId = 123;

  setUp(() {
    mockGetShowDetail = MockGetShowDetail();
    mockGetShowRecommendations = MockGetShowRecommendations();
    mockGetTelevisionWatchListStatus = MockGetTelevisionWatchlistStatus();
    mockTelevisionSaveWatchlist = MockTelevisionSaveWatchlist();
    mockTelevisionDeleteWatchlist = MockTelevisionDeleteWatchlist();
    bloc = TelevisionDetailBloc(
      getShowDetail: mockGetShowDetail,
      getShowRecommendations: mockGetShowRecommendations,
      getTelevisionWatchlistStatus: mockGetTelevisionWatchListStatus,
      televisionSaveWatchlist: mockTelevisionSaveWatchlist,
      televisionDeleteWatchlist: mockTelevisionDeleteWatchlist,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test('should has an initial state on initial', () {
    expect(bloc.state, TelevisionDetailState.initial());
  });

  group('televisionDetailRequested', () {
    void setUpMockGetShowDetailSuccess() {
      when(mockGetShowDetail(any))
          .thenAnswer((_) async => right(testTelevisionDetail));
    }

    blocTest(
      'should call [GetShowDetail] usecase',
      setUp: () => setUpMockGetShowDetailSuccess(),
      build: () => bloc,
      act: (bloc) => bloc
          .add(const TelevisionDetailEvent.televisionDetailRequested(testId)),
      verify: (bloc) => verify(mockGetShowDetail(testId)),
    );

    blocTest(
      'should emit states with [televisionDetailFetchState] is [loadInProgress, loadSuccess] '
      'when data is gotten successfully',
      setUp: () => setUpMockGetShowDetailSuccess(),
      build: () => bloc,
      act: (bloc) => bloc
          .add(const TelevisionDetailEvent.televisionDetailRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          televisionDetailFetchState:
              const TelevisionDetailFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          televisionDetailFetchState:
              const TelevisionDetailFetchState.loadSuccess(
                  testTelevisionDetail),
        ),
      ],
    );

    blocTest(
      'should emit states with [televisionDetailFetchState] is [loadInProgress, loadFailure] '
      'when getting data is failed',
      setUp: () => when(mockGetShowDetail(any))
          .thenAnswer((_) async => left(const ServerFailure(''))),
      build: () => bloc,
      act: (bloc) => bloc
          .add(const TelevisionDetailEvent.televisionDetailRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          televisionDetailFetchState:
              const TelevisionDetailFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          televisionDetailFetchState:
              const TelevisionDetailFetchState.loadFailure(''),
        ),
      ],
    );
  });

  group('recommendationRequested', () {
    void setUpMockGetShowRecommendationsSuccess() {
      when(mockGetShowRecommendations(any))
          .thenAnswer((_) async => right(testTelevisionList));
    }

    blocTest(
      'should call [GetShowRecommendations] usecase',
      setUp: () => setUpMockGetShowRecommendationsSuccess(),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const TelevisionDetailEvent.recommendationRequested(testId)),
      verify: (bloc) => verify(mockGetShowRecommendations(testId)),
    );

    blocTest(
      'should emit states with [recommendationFetchState] is [loadInProgress, loadSuccess] '
      'when data is gotten successfully',
      setUp: () => setUpMockGetShowRecommendationsSuccess(),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const TelevisionDetailEvent.recommendationRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          tvRecommendationFetchState:
              const TvRecommendationFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          tvRecommendationFetchState:
              const TvRecommendationFetchState.loadSuccess(testTelevisionList),
        ),
      ],
    );

    blocTest(
      'should emit states with [recommendationFetchState] is [loadInProgress, loadFailure] '
      'when getting data is failed',
      setUp: () => when(mockGetShowRecommendations(any))
          .thenAnswer((_) async => left(const ServerFailure(''))),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const TelevisionDetailEvent.recommendationRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          tvRecommendationFetchState:
              const TvRecommendationFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          tvRecommendationFetchState:
              const TvRecommendationFetchState.loadFailure(''),
        ),
      ],
    );
  });

  group('watchlistStatusRequested', () {
    void setUpGetTelevisionWatchlistStatus(bool status) {
      when(mockGetTelevisionWatchListStatus(any))
          .thenAnswer((_) async => status);
    }

    blocTest(
      'should call [GetTelevisionWatchlistStatus] usecase',
      setUp: () => setUpGetTelevisionWatchlistStatus(true),
      build: () => bloc,
      act: (bloc) => bloc
          .add(const TelevisionDetailEvent.watchlistStatusRequested(testId)),
      verify: (bloc) => verify(mockGetTelevisionWatchListStatus(testId)),
    );

    blocTest(
      'should emit a state with [isAddedToWatchlist] is true '
      'when the television is in the watchlist',
      setUp: () => setUpGetTelevisionWatchlistStatus(true),
      build: () => bloc,
      act: (bloc) => bloc
          .add(const TelevisionDetailEvent.watchlistStatusRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          isAddedToWatchlist: true,
        ),
      ],
    );

    blocTest(
      'should emit a state with [isAddedToWatchlist] is false '
      'when the television is not in the watchlist',
      setUp: () => setUpGetTelevisionWatchlistStatus(false),
      build: () => bloc,
      act: (bloc) => bloc
          .add(const TelevisionDetailEvent.watchlistStatusRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          isAddedToWatchlist: false,
        ),
      ],
    );
  });

  group('addToWatchlistPressed', () {
    void setUpTelevisionSaveWatchlistSuccess() {
      when(mockTelevisionSaveWatchlist(any))
          .thenAnswer((_) async => right('Added To Watchlist'));
    }

    blocTest(
      'should call [TelevisionSaveWatchlist] usecase',
      setUp: () => setUpTelevisionSaveWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TelevisionDetailEvent.addToWatchlistPressed(testTelevisionDetail),
      ),
      verify: (bloc) =>
          verify(mockTelevisionSaveWatchlist(testTelevisionDetail)),
    );

    blocTest(
      'should emit states with [watchlistActionState] is [loadInProgress, loadSuccess] '
      'when action is done successfully',
      setUp: () => setUpTelevisionSaveWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TelevisionDetailEvent.addToWatchlistPressed(testTelevisionDetail),
      ),
      expect: () => [
        bloc.state.copyWith(
          watchlistActionState: const WatchlistActionState.actionInProgress(),
        ),
        bloc.state.copyWith(
          watchlistActionState:
              const WatchlistActionState.actionSuccess('Added To Watchlist'),
        ),
      ],
    );

    blocTest(
      'should emit states with [watchlistActionState] is [loadInProgress, loadFailure] '
      'when doing action is failed',
      setUp: () => when(mockTelevisionSaveWatchlist(any))
          .thenAnswer((_) async => left(const DatabaseFailure('Failed'))),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TelevisionDetailEvent.addToWatchlistPressed(testTelevisionDetail),
      ),
      expect: () => [
        bloc.state.copyWith(
          watchlistActionState: const WatchlistActionState.actionInProgress(),
        ),
        bloc.state.copyWith(
          watchlistActionState:
              const WatchlistActionState.actionFailure('Failed'),
        ),
      ],
    );
  });

  group('removeFromWatchlistPressed', () {
    void setUpTelevisionDeleteWatchlistSuccess() {
      when(mockTelevisionDeleteWatchlist(any))
          .thenAnswer((_) async => right('Removed From Watchlist'));
    }

    blocTest(
      'should call [TelevisionDeleteWatchlist] usecase',
      setUp: () => setUpTelevisionDeleteWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TelevisionDetailEvent.removeFromWatchlistPressed(
            testTelevisionDetail),
      ),
      verify: (bloc) =>
          verify(mockTelevisionDeleteWatchlist(testTelevisionDetail)),
    );

    blocTest(
      'should emit states with [watchlistActionState] is [loadInProgress, loadSuccess] '
      'when action is done successfully',
      setUp: () => setUpTelevisionDeleteWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TelevisionDetailEvent.removeFromWatchlistPressed(
            testTelevisionDetail),
      ),
      expect: () => [
        bloc.state.copyWith(
          watchlistActionState: const WatchlistActionState.actionInProgress(),
        ),
        bloc.state.copyWith(
          watchlistActionState: const WatchlistActionState.actionSuccess(
              'Removed From Watchlist'),
        ),
      ],
    );

    blocTest(
      'should emit states with [watchlistActionState] is [loadInProgress, loadFailure] '
      'when doing action is failed',
      setUp: () => when(mockTelevisionDeleteWatchlist(any))
          .thenAnswer((_) async => left(const DatabaseFailure('Failed'))),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const TelevisionDetailEvent.removeFromWatchlistPressed(
            testTelevisionDetail),
      ),
      expect: () => [
        bloc.state.copyWith(
          watchlistActionState: const WatchlistActionState.actionInProgress(),
        ),
        bloc.state.copyWith(
          watchlistActionState:
              const WatchlistActionState.actionFailure('Failed'),
        ),
      ],
    );
  });
}
