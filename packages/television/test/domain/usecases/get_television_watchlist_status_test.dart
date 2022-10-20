import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/get_television_watchlist_status.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetTelevisionWatchlistStatus getTelevisionWatchlistStatus;

  const testId = 1399;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getTelevisionWatchlistStatus =
        GetTelevisionWatchlistStatus(mockTelevisionRepository);
  });

  test(
    'should get watchlist status from the repository',
    () async {
      when(mockTelevisionRepository.isAddedToWatchlist(any))
          .thenAnswer((_) async => true);

      final result = await getTelevisionWatchlistStatus(testId);

      verify(mockTelevisionRepository.isAddedToWatchlist(testId));
      expect(result, true);
    },
  );
}
