import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/television_save_watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late TelevisionSaveWatchlist televisionSaveWatchlist;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    televisionSaveWatchlist = TelevisionSaveWatchlist(mockTelevisionRepository);
  });

  test('should save television to the repository', () async {
    when(mockTelevisionRepository.saveWatchlist(testTelevisionDetail))
        .thenAnswer((_) async => right('Added to Watchlist'));

    final result = await televisionSaveWatchlist(testTelevisionDetail);

    verify(mockTelevisionRepository.saveWatchlist(testTelevisionDetail));
    expect(result, right('Added to Watchlist'));
  });
}
