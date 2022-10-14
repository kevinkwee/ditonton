import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/common/failure.dart';
import 'package:ditonton/data/datasources/television_local_data_source.dart';
import 'package:ditonton/data/datasources/television_remote_data_source.dart';
import 'package:ditonton/data/repositories/television_repository_impl.dart';

import '../../dummy_data/dummy_objects.dart';
import 'television_repository_impl_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TelevisionRemoteDataSource>(),
  MockSpec<TelevisionLocalDataSource>(),
])
void main() {
  late TelevisionRepositoryImpl repository;
  late MockTelevisionRemoteDataSource mockRemoteDataSource;
  late MockTelevisionLocalDataSource mockLocalDataSource;

  setUp(() {
    mockRemoteDataSource = MockTelevisionRemoteDataSource();
    mockLocalDataSource = MockTelevisionLocalDataSource();
    repository = TelevisionRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  group('getOnTheAirShows', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getOnTheAirShows())
            .thenAnswer((_) async => testTelevisionModelList);

        final result = await repository.getOnTheAirShows();

        verify(mockRemoteDataSource.getOnTheAirShows());
        expect(
          result.getOrElse(() => []),
          equals(testTelevisionList),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getOnTheAirShows())
            .thenThrow(ServerException());

        final result = await repository.getOnTheAirShows();

        verify(mockRemoteDataSource.getOnTheAirShows());
        expect(result, equals(left(const ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getOnTheAirShows()).thenThrow(
            const SocketException('Failed to connect to the network'));

        final result = await repository.getOnTheAirShows();

        verify(mockRemoteDataSource.getOnTheAirShows());
        expect(
          result,
          equals(left(
              const ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });

  group('getPopularShows', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getPopularShows())
            .thenAnswer((_) async => testTelevisionModelList);

        final result = await repository.getPopularShows();

        verify(mockRemoteDataSource.getPopularShows());
        expect(
          result.getOrElse(() => []),
          equals(testTelevisionList),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getPopularShows())
            .thenThrow(ServerException());

        final result = await repository.getPopularShows();

        verify(mockRemoteDataSource.getPopularShows());
        expect(result, equals(left(const ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getPopularShows()).thenThrow(
            const SocketException('Failed to connect to the network'));

        final result = await repository.getPopularShows();

        verify(mockRemoteDataSource.getPopularShows());
        expect(
          result,
          equals(left(
              const ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });

  group('getTopRatedShows', () {
    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getTopRatedShows())
            .thenAnswer((_) async => testTelevisionModelList);

        final result = await repository.getTopRatedShows();

        verify(mockRemoteDataSource.getTopRatedShows());
        expect(
          result.getOrElse(() => []),
          equals(testTelevisionList),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getTopRatedShows())
            .thenThrow(ServerException());

        final result = await repository.getTopRatedShows();

        verify(mockRemoteDataSource.getTopRatedShows());
        expect(result, equals(left(const ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getTopRatedShows()).thenThrow(
            const SocketException('Failed to connect to the network'));

        final result = await repository.getTopRatedShows();

        verify(mockRemoteDataSource.getTopRatedShows());
        expect(
          result,
          equals(left(
              const ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });

  group('searchShows', () {
    const testQuery = 'dark';

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.searchShows(testQuery))
            .thenAnswer((_) async => testTelevisionModelList);

        final result = await repository.searchShows(testQuery);

        verify(mockRemoteDataSource.searchShows(testQuery));
        expect(
          result.getOrElse(() => []),
          equals(testTelevisionList),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.searchShows(testQuery))
            .thenThrow(ServerException());

        final result = await repository.searchShows(testQuery);

        verify(mockRemoteDataSource.searchShows(testQuery));
        expect(result, equals(left(const ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.searchShows(testQuery)).thenThrow(
          const SocketException('Failed to connect to the network'),
        );

        final result = await repository.searchShows(testQuery);

        verify(mockRemoteDataSource.searchShows(testQuery));
        expect(
          result,
          equals(
            left(const ConnectionFailure('Failed to connect to the network')),
          ),
        );
      },
    );
  });

  group('getShowDetail', () {
    const testId = 1399;

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getShowDetail(any))
            .thenAnswer((_) async => testTelevisionDetailModel);

        final result = await repository.getShowDetail(testId);

        verify(mockRemoteDataSource.getShowDetail(testId));
        expect(result, equals(right(testTelevisionDetail)));
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getShowDetail(any))
            .thenThrow(ServerException());

        final result = await repository.getShowDetail(testId);

        verify(mockRemoteDataSource.getShowDetail(testId));
        expect(result, equals(left(const ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getShowDetail(any)).thenThrow(
            const SocketException('Failed to connect to the network'));

        final result = await repository.getShowDetail(testId);

        verify(mockRemoteDataSource.getShowDetail(testId));
        expect(
          result,
          equals(left(
              const ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });

  group('getShowRecommendations', () {
    const testId = 1399;

    test(
      'should return remote data when the call to remote data source is successful',
      () async {
        when(mockRemoteDataSource.getShowRecommendations(any))
            .thenAnswer((_) async => testTelevisionModelList);

        final result = await repository.getShowRecommendations(testId);

        verify(mockRemoteDataSource.getShowRecommendations(testId));
        expect(
          result.getOrElse(() => []),
          equals(testTelevisionList),
        );
      },
    );

    test(
      'should return server failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getShowRecommendations(any))
            .thenThrow(ServerException());

        final result = await repository.getShowRecommendations(testId);

        verify(mockRemoteDataSource.getShowRecommendations(testId));
        expect(result, equals(left(const ServerFailure(''))));
      },
    );

    test(
      'should return connection failure when the call to remote data source is unsuccessful',
      () async {
        when(mockRemoteDataSource.getShowRecommendations(any)).thenThrow(
            const SocketException('Failed to connect to the network'));

        final result = await repository.getShowRecommendations(testId);

        verify(mockRemoteDataSource.getShowRecommendations(testId));
        expect(
          result,
          equals(left(
              const ConnectionFailure('Failed to connect to the network'))),
        );
      },
    );
  });

  group('isAddedToWatchlist', () {
    test('should return watchlist status whether data is found', () async {
      const testId = 1399;

      when(mockLocalDataSource.getTelevisionById(testId))
          .thenAnswer((_) async => null);

      final result = await repository.isAddedToWatchlist(testId);

      expect(result, false);
    });
  });

  group('getTelevisionWatchlist', () {
    test('should return list of Televisions', () async {
      when(mockLocalDataSource.getTelevisionWatchlist())
          .thenAnswer((_) async => [testTelevisionWatchlistModel]);

      final result = await repository.getTelevisionWatchlist();

      expect(
        result.getOrElse(() => []),
        [testTelevisionWatchlist],
      );
    });
  });

  group('saveWatchlist', () {
    test('should return success message when saving successful', () async {
      when(mockLocalDataSource.insertWatchlist(testTelevisionWatchlistModel))
          .thenAnswer((_) async => 'Added to Watchlist');

      final result = await repository.saveWatchlist(testTelevisionDetail);

      expect(result, right('Added to Watchlist'));
    });

    test('should return DatabaseFailure when saving unsuccessful', () async {
      when(mockLocalDataSource.insertWatchlist(testTelevisionWatchlistModel))
          .thenThrow(DatabaseException('Failed to add watchlist'));

      final result = await repository.saveWatchlist(testTelevisionDetail);

      expect(result, left(const DatabaseFailure('Failed to add watchlist')));
    });
  });

  group('deleteWatchlist', () {
    test('should return success message when remove successful', () async {
      when(mockLocalDataSource.removeWatchlist(testTelevisionWatchlistModel))
          .thenAnswer((_) async => 'Removed from watchlist');

      final result = await repository.deleteWatchlist(testTelevisionDetail);

      expect(result, right('Removed from watchlist'));
    });

    test('should return DatabaseFailure when remove unsuccessful', () async {
      when(mockLocalDataSource.removeWatchlist(testTelevisionWatchlistModel))
          .thenThrow(DatabaseException('Failed to remove watchlist'));

      final result = await repository.deleteWatchlist(testTelevisionDetail);

      expect(result, left(const DatabaseFailure('Failed to remove watchlist')));
    });
  });
}
