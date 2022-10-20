import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/television_delete_watchlist.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late TelevisionDeleteWatchlist televisionDeleteWatchlist;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    televisionDeleteWatchlist =
        TelevisionDeleteWatchlist(mockTelevisionRepository);
  });

  test('should save television to the repository', () async {
    when(mockTelevisionRepository.deleteWatchlist(testTelevisionDetail))
        .thenAnswer((_) async => right('Removed from watchlist'));

    final result = await televisionDeleteWatchlist(testTelevisionDetail);

    verify(mockTelevisionRepository.deleteWatchlist(testTelevisionDetail));
    expect(result, right('Removed from watchlist'));
  });
}
