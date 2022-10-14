import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/television/get_popular_shows.dart';
import 'package:ditonton/presentation/provider/television/popular_shows_notifier.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'popular_shows_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetPopularShows>(),
])
void main() {
  late MockGetPopularShows mockGetPopularShows;
  late PopularShowsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetPopularShows = MockGetPopularShows();
    notifier = PopularShowsNotifier(mockGetPopularShows)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  void setUpMockGetPopularShowsSuccess() {
    when(mockGetPopularShows())
        .thenAnswer((_) async => right(testTelevisionList));
  }

  test('should has an empty state on initial', () {
    expect(notifier.state, RequestState.Empty);
  });

  test(
    'should get data from the concrete usecase',
    () async {
      setUpMockGetPopularShowsSuccess();

      await notifier.fetchPopularShows();

      verify(mockGetPopularShows());
    },
  );

  test(
    'should change state to loading when usecase is called',
    () async {
      setUpMockGetPopularShowsSuccess();

      notifier.fetchPopularShows();

      expect(notifier.state, RequestState.Loading);
      expect(listenerCallCount, 1);
    },
  );

  test(
    'should change television shows data when data is gotten successfully',
    () async {
      setUpMockGetPopularShowsSuccess();

      await notifier.fetchPopularShows();

      expect(notifier.state, RequestState.Loaded);
      expect(notifier.televisionShows, equals(testTelevisionList));
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should change message data when getting data is unsuccessful',
    () async {
      when(mockGetPopularShows())
          .thenAnswer((_) async => left(const ServerFailure('Server Failure')));

      await notifier.fetchPopularShows();

      expect(notifier.state, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    },
  );
}
