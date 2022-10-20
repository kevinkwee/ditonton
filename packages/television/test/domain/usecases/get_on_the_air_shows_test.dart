import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:television/src/domain/usecases/get_on_the_air_shows.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetOnTheAirShows getOnTheAirShows;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getOnTheAirShows = GetOnTheAirShows(mockTelevisionRepository);
  });

  test(
    'should get list of shows from the repository',
    () async {
      when(mockTelevisionRepository.getOnTheAirShows())
          .thenAnswer((_) async => right(testTelevisionList));

      final result = await getOnTheAirShows();

      verify(mockTelevisionRepository.getOnTheAirShows());
      expect(result, equals(right(testTelevisionList)));
    },
  );
}
