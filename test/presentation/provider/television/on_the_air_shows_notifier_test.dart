import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/television/get_on_the_air_shows.dart';
import 'package:ditonton/presentation/provider/television/on_the_air_shows_notifier.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'on_the_air_shows_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetOnTheAirShows>(),
])
void main() {
  late MockGetOnTheAirShows mockGetOnTheAirShows;
  late OnTheAirShowsNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetOnTheAirShows = MockGetOnTheAirShows();
    notifier = OnTheAirShowsNotifier(mockGetOnTheAirShows)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  void setUpMockGetOnTheAirShowsSuccess() {
    when(mockGetOnTheAirShows())
        .thenAnswer((_) async => right(testTelevisionList));
  }

  test('should has an empty state on initial', () {
    expect(notifier.state, RequestState.Empty);
  });

  test(
    'should get data from the concrete usecase',
    () async {
      setUpMockGetOnTheAirShowsSuccess();

      await notifier.fetchOnTheAirShows();

      verify(mockGetOnTheAirShows());
    },
  );

  test(
    'should change state to loading when usecase is called',
    () async {
      setUpMockGetOnTheAirShowsSuccess();

      notifier.fetchOnTheAirShows();

      expect(notifier.state, RequestState.Loading);
      expect(listenerCallCount, 1);
    },
  );

  test(
    'should change television shows data when data is gotten successfully',
    () async {
      setUpMockGetOnTheAirShowsSuccess();

      await notifier.fetchOnTheAirShows();

      expect(notifier.state, RequestState.Loaded);
      expect(notifier.televisionShows, equals(testTelevisionList));
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should change message data when getting data is unsuccessful',
    () async {
      when(mockGetOnTheAirShows())
          .thenAnswer((_) async => left(const ServerFailure('Server Failure')));

      await notifier.fetchOnTheAirShows();

      expect(notifier.state, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    },
  );
}
