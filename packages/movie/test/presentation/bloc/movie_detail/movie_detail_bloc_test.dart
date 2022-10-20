import 'package:bloc_test/bloc_test.dart';
import 'package:core/core.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:movie/src/domain/usecases/get_movie_detail.dart';
import 'package:movie/src/domain/usecases/get_movie_recommendations.dart';
import 'package:movie/src/domain/usecases/get_watchlist_status.dart';
import 'package:movie/src/domain/usecases/remove_watchlist.dart';
import 'package:movie/src/domain/usecases/save_watchlist.dart';
import 'package:movie/src/presentation/bloc/movie_detail/movie_detail_bloc.dart';
import 'package:movie/src/presentation/bloc/movie_detail/movie_detail_fetch_state.dart';
import 'package:movie/src/presentation/bloc/movie_detail/recommendation_fetch_state.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'movie_detail_bloc_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetMovieDetail>(),
  MockSpec<GetMovieRecommendations>(),
  MockSpec<GetWatchListStatus>(),
  MockSpec<SaveWatchlist>(),
  MockSpec<RemoveWatchlist>(),
])
void main() {
  late MovieDetailBloc bloc;
  late MockGetMovieDetail mockGetMovieDetail;
  late MockGetMovieRecommendations mockGetMovieRecommendations;
  late MockGetWatchListStatus mockGetWatchListStatus;
  late MockSaveWatchlist mockSaveWatchlist;
  late MockRemoveWatchlist mockRemoveWatchlist;

  const testId = 123;

  setUp(() {
    mockGetMovieDetail = MockGetMovieDetail();
    mockGetMovieRecommendations = MockGetMovieRecommendations();
    mockGetWatchListStatus = MockGetWatchListStatus();
    mockSaveWatchlist = MockSaveWatchlist();
    mockRemoveWatchlist = MockRemoveWatchlist();
    bloc = MovieDetailBloc(
      getMovieDetail: mockGetMovieDetail,
      getMovieRecommendations: mockGetMovieRecommendations,
      getWatchListStatus: mockGetWatchListStatus,
      saveWatchlist: mockSaveWatchlist,
      removeWatchlist: mockRemoveWatchlist,
    );
  });

  tearDown(() {
    bloc.close();
  });

  test('should has an initial state on initial', () {
    expect(bloc.state, MovieDetailState.initial());
  });

  group('movieDetailRequested', () {
    void setUpMockGetMovieDetailSuccess() {
      when(mockGetMovieDetail.execute(any))
          .thenAnswer((_) async => right(testMovieDetail));
    }

    blocTest(
      'should call [GetMovieDetail] usecase',
      setUp: () => setUpMockGetMovieDetailSuccess(),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.movieDetailRequested(testId)),
      verify: (bloc) => verify(mockGetMovieDetail.execute(testId)),
    );

    blocTest(
      'should emit states with [movieDetailFetchState] is [loadInProgress, loadSuccess] '
      'when data is gotten successfully',
      setUp: () => setUpMockGetMovieDetailSuccess(),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.movieDetailRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          movieDetailFetchState: const MovieDetailFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          movieDetailFetchState:
              const MovieDetailFetchState.loadSuccess(testMovieDetail),
        ),
      ],
    );

    blocTest(
      'should emit states with [movieDetailFetchState] is [loadInProgress, loadFailure] '
      'when getting data is failed',
      setUp: () => when(mockGetMovieDetail.execute(any))
          .thenAnswer((_) async => left(const ServerFailure(''))),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.movieDetailRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          movieDetailFetchState: const MovieDetailFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          movieDetailFetchState: const MovieDetailFetchState.loadFailure(''),
        ),
      ],
    );
  });

  group('recommendationRequested', () {
    void setUpMockGetMovieRecommendationsSuccess() {
      when(mockGetMovieRecommendations.execute(any))
          .thenAnswer((_) async => right(testMovieList));
    }

    blocTest(
      'should call [GetMovieRecommendations] usecase',
      setUp: () => setUpMockGetMovieRecommendationsSuccess(),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.recommendationRequested(testId)),
      verify: (bloc) => verify(mockGetMovieRecommendations.execute(testId)),
    );

    blocTest(
      'should emit states with [recommendationFetchState] is [loadInProgress, loadSuccess] '
      'when data is gotten successfully',
      setUp: () => setUpMockGetMovieRecommendationsSuccess(),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.recommendationRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          recommendationFetchState:
              const RecommendationFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
            recommendationFetchState:
                RecommendationFetchState.loadSuccess(testMovieList)),
      ],
    );

    blocTest(
      'should emit states with [recommendationFetchState] is [loadInProgress, loadFailure] '
      'when getting data is failed',
      setUp: () => when(mockGetMovieRecommendations.execute(any))
          .thenAnswer((_) async => left(const ServerFailure(''))),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.recommendationRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          recommendationFetchState:
              const RecommendationFetchState.loadInProgress(),
        ),
        bloc.state.copyWith(
          recommendationFetchState:
              const RecommendationFetchState.loadFailure(''),
        ),
      ],
    );
  });

  group('watchlistStatusRequested', () {
    void setUpGetWatchlistStatus(bool status) {
      when(mockGetWatchListStatus.execute(any)).thenAnswer((_) async => status);
    }

    blocTest(
      'should call [GetWatchlistStatus] usecase',
      setUp: () => setUpGetWatchlistStatus(true),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.watchlistStatusRequested(testId)),
      verify: (bloc) => verify(mockGetWatchListStatus.execute(testId)),
    );

    blocTest(
      'should emit a state with [isAddedToWatchlist] is true '
      'when the movie is in the watchlist',
      setUp: () => setUpGetWatchlistStatus(true),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.watchlistStatusRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          isAddedToWatchlist: true,
        ),
      ],
    );

    blocTest(
      'should emit a state with [isAddedToWatchlist] is false '
      'when the movie is not in the watchlist',
      setUp: () => setUpGetWatchlistStatus(false),
      build: () => bloc,
      act: (bloc) =>
          bloc.add(const MovieDetailEvent.watchlistStatusRequested(testId)),
      expect: () => [
        bloc.state.copyWith(
          isAddedToWatchlist: false,
        ),
      ],
    );
  });

  group('addToWatchlistPressed', () {
    void setUpSaveWatchlistSuccess() {
      when(mockSaveWatchlist.execute(any))
          .thenAnswer((_) async => right('Added To Watchlist'));
    }

    blocTest(
      'should call [SaveWatchlist] and [GetWatchlistStatus] usecase',
      setUp: () => setUpSaveWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const MovieDetailEvent.addToWatchlistPressed(testMovieDetail),
      ),
      verify: (_) => verify(mockSaveWatchlist.execute(testMovieDetail)),
    );

    blocTest(
      'should emit states with [watchlistActionState] is [loadInProgress, loadSuccess] '
      'when action is done successfully',
      setUp: () => setUpSaveWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const MovieDetailEvent.addToWatchlistPressed(testMovieDetail),
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
      setUp: () => when(mockSaveWatchlist.execute(any))
          .thenAnswer((_) async => left(const DatabaseFailure('Failed'))),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const MovieDetailEvent.addToWatchlistPressed(testMovieDetail),
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
    void setUpRemoveWatchlistSuccess() {
      when(mockRemoveWatchlist.execute(any))
          .thenAnswer((_) async => right('Removed From Watchlist'));
    }

    blocTest(
      'should call [RemoveWatchlist] usecase',
      setUp: () => setUpRemoveWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const MovieDetailEvent.removeFromWatchlistPressed(testMovieDetail),
      ),
      verify: (bloc) => verify(mockRemoveWatchlist.execute(testMovieDetail)),
    );

    blocTest(
      'should emit states with [watchlistActionState] is [loadInProgress, loadSuccess] '
      'when action is done successfully',
      setUp: () => setUpRemoveWatchlistSuccess(),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const MovieDetailEvent.removeFromWatchlistPressed(testMovieDetail),
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
      setUp: () => when(mockRemoveWatchlist.execute(any))
          .thenAnswer((_) async => left(const DatabaseFailure('Failed'))),
      build: () => bloc,
      act: (bloc) => bloc.add(
        const MovieDetailEvent.removeFromWatchlistPressed(testMovieDetail),
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
