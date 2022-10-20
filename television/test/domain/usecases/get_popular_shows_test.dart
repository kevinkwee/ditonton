import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/get_popular_shows.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetPopularShows getPopularShows;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getPopularShows = GetPopularShows(mockTelevisionRepository);
  });

  test(
    'should get list of shows from the repository',
    () async {
      when(mockTelevisionRepository.getPopularShows())
          .thenAnswer((_) async => right(testTelevisionList));

      final result = await getPopularShows();

      verify(mockTelevisionRepository.getPopularShows());
      expect(result, equals(right(testTelevisionList)));
    },
  );
}
