import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/television/search_shows.dart';
import 'package:ditonton/presentation/provider/television/show_search_notifier.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'show_search_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<SearchShows>(),
])
void main() {
  late MockSearchShows mockSearchShows;
  late ShowSearchNotifier notifier;
  late int listenerCallCount;

  const testQuery = 'dark';

  setUp(() {
    listenerCallCount = 0;
    mockSearchShows = MockSearchShows();
    notifier = ShowSearchNotifier(mockSearchShows)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  void setUpMockSearchShowsSuccess() {
    when(mockSearchShows(any))
        .thenAnswer((_) async => right(testTelevisionList));
  }

  test('should has an empty state on initial', () {
    expect(notifier.state, RequestState.Empty);
  });

  test(
    'should get data from the concrete usecase',
    () async {
      setUpMockSearchShowsSuccess();

      await notifier.fetchShowSearch(testQuery);

      verify(mockSearchShows(testQuery));
    },
  );

  test(
    'should change state to loading when usecase is called',
    () async {
      setUpMockSearchShowsSuccess();

      notifier.fetchShowSearch(testQuery);

      expect(notifier.state, RequestState.Loading);
      expect(listenerCallCount, 1);
    },
  );

  test(
    'should change television shows data when data is gotten successfully',
    () async {
      setUpMockSearchShowsSuccess();

      await notifier.fetchShowSearch(testQuery);

      expect(notifier.state, RequestState.Loaded);
      expect(notifier.searchResults, equals(testTelevisionList));
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should change message data when getting data is unsuccessful',
    () async {
      when(mockSearchShows(any))
          .thenAnswer((_) async => left(const ServerFailure('Server Failure')));

      await notifier.fetchShowSearch(testQuery);

      expect(notifier.state, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    },
  );
}
