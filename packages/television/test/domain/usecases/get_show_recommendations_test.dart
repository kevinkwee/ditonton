import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/get_show_recommendations.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetShowRecommendations getShowRecommendations;

  const testId = 1399;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getShowRecommendations = GetShowRecommendations(mockTelevisionRepository);
  });

  test(
    'should get list of shows from the repository',
    () async {
      when(mockTelevisionRepository.getShowRecommendations(any))
          .thenAnswer((_) async => right(testTelevisionList));

      final result = await getShowRecommendations(testId);

      verify(mockTelevisionRepository.getShowRecommendations(testId));
      expect(
        result.getOrElse(() => []),
        equals(testTelevisionList),
      );
    },
  );
}
