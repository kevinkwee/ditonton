import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:television/src/domain/usecases/get_show_detail.dart';

import '../../dummy_data/dummy_objects.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late MockTelevisionRepository mockTelevisionRepository;
  late GetShowDetail getShowDetail;

  const testId = 1399;

  setUp(() {
    mockTelevisionRepository = MockTelevisionRepository();
    getShowDetail = GetShowDetail(mockTelevisionRepository);
  });

  test(
    'should get TelevisionDetail from the repository',
    () async {
      when(mockTelevisionRepository.getShowDetail(any))
          .thenAnswer((_) async => right(testTelevisionDetail));

      final result = await getShowDetail(testId);

      verify(mockTelevisionRepository.getShowDetail(testId));
      expect(result, equals(right(testTelevisionDetail)));
    },
  );
}
