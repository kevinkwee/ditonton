import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/domain/usecases/television/get_television_watchlist.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetTelevisionWatchlist getTelevisionWatchlist;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getTelevisionWatchlist = GetTelevisionWatchlist(mockTelevisionRepository);
  });

  test(
    'should get list of TelevisionWatchlist from the repository',
    () async {
      when(mockTelevisionRepository.getTelevisionWatchlist())
          .thenAnswer((_) async => right([testTelevisionWatchlist]));

      final result = await getTelevisionWatchlist();

      verify(mockTelevisionRepository.getTelevisionWatchlist());
      expect(
        result.getOrElse(() => []),
        equals([testTelevisionWatchlist]),
      );
    },
  );
}
