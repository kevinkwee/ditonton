import 'package:dartz/dartz.dart';
import 'package:ditonton/domain/usecases/television/get_television_watchlist_status.dart';
import 'package:ditonton/domain/usecases/television/television_delete_watchlist.dart';
import 'package:ditonton/domain/usecases/television/television_save_watchlist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/television/get_show_detail.dart';
import 'package:ditonton/domain/usecases/television/get_show_recommendations.dart';
import 'package:ditonton/presentation/provider/television/show_detail_notifier.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'show_detail_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetShowDetail>(),
  MockSpec<GetShowRecommendations>(),
  MockSpec<GetTelevisionWatchlistStatus>(),
  MockSpec<TelevisionSaveWatchlist>(),
  MockSpec<TelevisionDeleteWatchlist>(),
])
void main() {
  late MockGetShowDetail mockGetShowDetail;
  late MockGetShowRecommendations mockGetShowRecommendations;
  late MockGetTelevisionWatchlistStatus mockGetTelevisionWatchlistStatus;
  late MockTelevisionSaveWatchlist mockTelevisionSaveWatchlist;
  late MockTelevisionDeleteWatchlist mockTelevisionDeleteWatchlist;
  late ShowDetailNotifier notifier;
  late int listenerCallCount;

  const testId = 1399;

  setUp(() {
    listenerCallCount = 0;
    mockGetShowDetail = MockGetShowDetail();
    mockGetShowRecommendations = MockGetShowRecommendations();
    mockGetTelevisionWatchlistStatus = MockGetTelevisionWatchlistStatus();
    mockTelevisionSaveWatchlist = MockTelevisionSaveWatchlist();
    mockTelevisionDeleteWatchlist = MockTelevisionDeleteWatchlist();
    notifier = ShowDetailNotifier(
      getShowDetail: mockGetShowDetail,
      getShowRecommendations: mockGetShowRecommendations,
      getTelevisionWatchlistStatus: mockGetTelevisionWatchlistStatus,
      televisionSaveWatchlist: mockTelevisionSaveWatchlist,
      televisionDeleteWatchlist: mockTelevisionDeleteWatchlist,
    )..addListener(() {
        listenerCallCount++;
      });
  });

  void setUpUsecase() {
    when(mockGetShowDetail(any))
        .thenAnswer((_) async => right(testTelevisionDetail));
    when(mockGetShowRecommendations(any))
        .thenAnswer((_) async => right(testTelevisionList));
  }

  group('tv detail', () {
    test('should has an empty state on initial', () {
      expect(notifier.state, RequestState.Empty);
    });

    test(
      'should get data from the concrete usecase',
      () async {
        setUpUsecase();

        await notifier.fetchShowDetail(testId);

        verify(mockGetShowDetail(testId));
      },
    );

    test(
      'should change state to loading when usecase is called',
      () {
        setUpUsecase();

        notifier.fetchShowDetail(testId);

        expect(notifier.state, RequestState.Loading);
        expect(listenerCallCount, 1);
      },
    );

    test(
      'should change television detail data when data is gotten successfully',
      () async {
        setUpUsecase();

        await notifier.fetchShowDetail(testId);

        expect(notifier.state, RequestState.Loaded);
        expect(notifier.televisionDetail, equals(testTelevisionDetail));
        expect(listenerCallCount, 3);
      },
    );

    test(
      'should change message data when getting data is unsuccessful',
      () async {
        when(mockGetShowDetail(any)).thenAnswer(
            (_) async => left(const ServerFailure('Server Failure')));

        await notifier.fetchShowDetail(testId);

        expect(notifier.state, RequestState.Error);
        expect(notifier.message, 'Server Failure');
        expect(listenerCallCount, 2);
      },
    );
  });

  group('tv recommendations', () {
    test('should has an empty state on initial', () {
      expect(notifier.recommendationState, RequestState.Empty);
    });

    test(
      'should get data from the concrete usecase',
      () async {
        setUpUsecase();

        await notifier.fetchShowDetail(testId);

        verify(mockGetShowDetail(testId));
      },
    );

    test(
      'should update recommendation state when data is gotten successfully',
      () async {
        setUpUsecase();

        await notifier.fetchShowDetail(testId);

        expect(notifier.recommendationState, RequestState.Loaded);
        expect(notifier.televisionRecommendations, testTelevisionList);
      },
    );

    test(
      'should change message data when getting data is unsuccessful',
      () async {
        when(mockGetShowDetail(any))
            .thenAnswer((_) async => right(testTelevisionDetail));
        when(mockGetShowRecommendations(any)).thenAnswer(
            (_) async => left(const ServerFailure('Server Failure')));

        await notifier.fetchShowDetail(testId);

        expect(notifier.recommendationState, RequestState.Error);
        expect(notifier.message, 'Server Failure');
      },
    );
  });

  group('watchlist', () {
    test('should get the watchlist status', () async {
      when(mockGetTelevisionWatchlistStatus(1)).thenAnswer((_) async => true);

      await notifier.loadWatchlistStatus(1);

      expect(notifier.isAddedToWatchlist, true);
    });

    test('should execute save watchlist when function called', () async {
      when(mockTelevisionSaveWatchlist(testTelevisionDetail))
          .thenAnswer((_) async => right('Success'));
      when(mockGetTelevisionWatchlistStatus(testTelevisionDetail.id))
          .thenAnswer((_) async => true);

      await notifier.addWatchlist(testTelevisionDetail);

      verify(mockTelevisionSaveWatchlist(testTelevisionDetail));
    });

    test('should execute remove watchlist when function called', () async {
      when(mockTelevisionDeleteWatchlist(testTelevisionDetail))
          .thenAnswer((_) async => right('Removed'));
      when(mockGetTelevisionWatchlistStatus(testTelevisionDetail.id))
          .thenAnswer((_) async => false);

      await notifier.removeWatchlist(testTelevisionDetail);

      verify(mockTelevisionDeleteWatchlist(testTelevisionDetail));
    });

    test('should update watchlist status when add watchlist success', () async {
      when(mockTelevisionSaveWatchlist(testTelevisionDetail))
          .thenAnswer((_) async => right('Added to Watchlist'));
      when(mockGetTelevisionWatchlistStatus(testTelevisionDetail.id))
          .thenAnswer((_) async => true);

      await notifier.addWatchlist(testTelevisionDetail);

      verify(mockGetTelevisionWatchlistStatus(testTelevisionDetail.id));
      expect(notifier.isAddedToWatchlist, true);
      expect(notifier.watchlistMessage, 'Added to Watchlist');
      expect(listenerCallCount, 1);
    });

    test('should update watchlist message when add watchlist failed', () async {
      when(mockTelevisionSaveWatchlist(testTelevisionDetail))
          .thenAnswer((_) async => left(const DatabaseFailure('Failed')));
      when(mockGetTelevisionWatchlistStatus(testTelevisionDetail.id))
          .thenAnswer((_) async => false);

      await notifier.addWatchlist(testTelevisionDetail);

      expect(notifier.watchlistMessage, 'Failed');
      expect(listenerCallCount, 1);
    });
  });
}
