import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/exception.dart';
import 'package:ditonton/data/datasources/db/television_database_helper.dart';
import 'package:ditonton/data/datasources/television_local_data_source.dart';

import '../../dummy_data/dummy_objects.dart';
import 'television_local_data_source_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<TelevisionDatabaseHelper>(),
])
void main() {
  late TelevisionLocalDataSourceImpl localDataSource;
  late MockTelevisionDatabaseHelper mockDatabaseHelper;

  setUp(() {
    mockDatabaseHelper = MockTelevisionDatabaseHelper();
    localDataSource =
        TelevisionLocalDataSourceImpl(databaseHelper: mockDatabaseHelper);
  });

  group('getTelevisionById', () {
    const testId = 1399;

    test(
      'should return TelevisionWatchlistModel when data is found',
      () async {
        when(mockDatabaseHelper.getTelevisionById(testId))
            .thenAnswer((_) async => testTelevisionWatchlistJson);

        final result = await localDataSource.getTelevisionById(testId);

        expect(result, testTelevisionWatchlistModel);
      },
    );

    test(
      'should return null when data is not found',
      () async {
        when(mockDatabaseHelper.getTelevisionById(testId))
            .thenAnswer((_) async => null);

        final result = await localDataSource.getTelevisionById(testId);

        expect(result, null);
      },
    );
  });

  group('getTelevisionWatchlist', () {
    test(
      'should return list of TelevisionWatchlistModel from database',
      () async {
        when(mockDatabaseHelper.getTelevisionWatchlist())
            .thenAnswer((_) async => [testTelevisionWatchlistJson]);

        final result = await localDataSource.getTelevisionWatchlist();

        expect(result, [testTelevisionWatchlistModel]);
      },
    );
  });

  group('insertWatchlist', () {
    test(
      'should return success message when insert to database is success',
      () async {
        when(mockDatabaseHelper.insertWatchlist(testTelevisionWatchlistModel))
            .thenAnswer((_) async => 1);

        final result =
            await localDataSource.insertWatchlist(testTelevisionWatchlistModel);

        expect(result, 'Added to Watchlist');
      },
    );

    test(
      'should throw DatabaseException when insert to database is failed',
      () async {
        when(mockDatabaseHelper.insertWatchlist(testTelevisionWatchlistModel))
            .thenThrow(Exception());

        final call =
            localDataSource.insertWatchlist(testTelevisionWatchlistModel);

        expect(() => call, throwsA(isA<DatabaseException>()));
      },
    );
  });

  group('removeWatchlist', () {
    test(
      'should return success message when remove from database is success',
      () async {
        when(mockDatabaseHelper.removeWatchlist(testTelevisionWatchlistModel))
            .thenAnswer((_) async => 1);

        final result =
            await localDataSource.removeWatchlist(testTelevisionWatchlistModel);

        expect(result, 'Removed from Watchlist');
      },
    );

    test(
      'should throw DatabaseException when remove from database is failed',
      () async {
        when(mockDatabaseHelper.removeWatchlist(testTelevisionWatchlistModel))
            .thenThrow(Exception());

        final call =
            localDataSource.removeWatchlist(testTelevisionWatchlistModel);

        expect(() => call, throwsA(isA<DatabaseException>()));
      },
    );
  });
}
