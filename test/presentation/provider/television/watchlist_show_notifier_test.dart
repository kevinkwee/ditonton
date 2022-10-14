import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:ditonton/common/failure.dart';
import 'package:ditonton/common/state_enum.dart';
import 'package:ditonton/domain/usecases/television/get_television_watchlist.dart';
import 'package:ditonton/presentation/provider/television/watchlist_show_notifier.dart';

import '../../../dummy_data/dummy_objects.dart';
import 'watchlist_show_notifier_test.mocks.dart';

@GenerateNiceMocks([
  MockSpec<GetTelevisionWatchlist>(),
])
void main() {
  late MockGetTelevisionWatchlist mockGetTelevisionWatchlist;
  late WatchlistShowNotifier notifier;
  late int listenerCallCount;

  setUp(() {
    listenerCallCount = 0;
    mockGetTelevisionWatchlist = MockGetTelevisionWatchlist();
    notifier = WatchlistShowNotifier(mockGetTelevisionWatchlist)
      ..addListener(() {
        listenerCallCount++;
      });
  });

  void setUpMockGetTelevisionWatchlistSuccess() {
    when(mockGetTelevisionWatchlist())
        .thenAnswer((_) async => right([testTelevisionWatchlist]));
  }

  test('should has an empty state on initial', () {
    expect(notifier.state, RequestState.Empty);
  });

  test(
    'should get data from the concrete usecase',
    () async {
      setUpMockGetTelevisionWatchlistSuccess();

      await notifier.fetchTelevisionWatchlist();

      verify(mockGetTelevisionWatchlist());
    },
  );

  test(
    'should change state to loading when usecase is called',
    () async {
      setUpMockGetTelevisionWatchlistSuccess();

      notifier.fetchTelevisionWatchlist();

      expect(notifier.state, RequestState.Loading);
      expect(listenerCallCount, 1);
    },
  );

  test(
    'should change television shows data when data is gotten successfully',
    () async {
      setUpMockGetTelevisionWatchlistSuccess();

      await notifier.fetchTelevisionWatchlist();

      expect(notifier.state, RequestState.Loaded);
      expect(notifier.televisionWatchlist, equals([testTelevisionWatchlist]));
      expect(listenerCallCount, 2);
    },
  );

  test(
    'should change message data when getting data is unsuccessful',
    () async {
      when(mockGetTelevisionWatchlist())
          .thenAnswer((_) async => left(const ServerFailure('Server Failure')));

      await notifier.fetchTelevisionWatchlist();

      expect(notifier.state, RequestState.Error);
      expect(notifier.message, 'Server Failure');
      expect(listenerCallCount, 2);
    },
  );
}
