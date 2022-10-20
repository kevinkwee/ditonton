import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/search_shows.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late SearchShows searchShows;

  const testQuery = 'dark';

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    searchShows = SearchShows(mockTelevisionRepository);
  });

  test('should get list of shows from the repository', () async {
    when(mockTelevisionRepository.searchShows(any))
        .thenAnswer((_) async => right(testTelevisionList));

    final result = await searchShows(testQuery);

    verify(mockTelevisionRepository.searchShows(testQuery));
    expect(result, equals(right(testTelevisionList)));
  });
}
