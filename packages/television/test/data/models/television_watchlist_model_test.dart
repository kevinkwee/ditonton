import 'package:flutter_test/flutter_test.dart';
import 'package:television/src/data/models/television_watchlist_model.dart';

import '../../dummy_data/dummy_objects.dart';

void main() {
  group('toEntity', () {
    test('should return a TelevisionWatchlist entity', () {
      final result = testTelevisionWatchlistModel.toEntity();

      expect(result, testTelevisionWatchlist);
    });
  });

  group('fromTelevisionDetailEntity', () {
    test('should return a valid model from TelevisionDetailEntity', () {
      final result = TelevisionWatchlistModel.fromTelevisionDetailEntity(
        testTelevisionDetail,
      );

      expect(result, testTelevisionWatchlistModel);
    });
  });

  group('fromJson', () {
    test('should return a valid model from JSON', () {
      final result =
          TelevisionWatchlistModel.fromJson(testTelevisionWatchlistJson);

      expect(result, testTelevisionWatchlistModel);
    });
  });

  group('toJson', () {
    test('should return a JSON containing the proper data', () {
      final result = testTelevisionWatchlistModel.toJson();

      expect(result, testTelevisionWatchlistJson);
    });
  });
}
