import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/domain/usecases/television/get_top_rated_shows.dart';

import '../../../dummy_data/dummy_objects.dart';
import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetTopRatedShows getTopRatedShows;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getTopRatedShows = GetTopRatedShows(mockTelevisionRepository);
  });

  test(
    'should get list of shows from the repository',
    () async {
      when(mockTelevisionRepository.getTopRatedShows())
          .thenAnswer((_) async => right(testTelevisionList));

      final result = await getTopRatedShows();

      verify(mockTelevisionRepository.getTopRatedShows());
      expect(result, equals(right(testTelevisionList)));
    },
  );
}
