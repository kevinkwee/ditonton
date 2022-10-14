import 'package:flutter/foundation.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/television_watchlist.dart';
import '../../../domain/usecases/television/get_television_watchlist.dart';

class WatchlistShowNotifier extends ChangeNotifier {
  WatchlistShowNotifier(this.getTelevisionWatchlist);

  final GetTelevisionWatchlist getTelevisionWatchlist;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<TelevisionWatchlist> _televisionWatchlist = [];
  List<TelevisionWatchlist> get televisionWatchlist => _televisionWatchlist;

  String _message = '';
  String get message => _message;

  Future<void> fetchTelevisionWatchlist() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTelevisionWatchlist();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (televisionWatchlist) {
        _televisionWatchlist = televisionWatchlist;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
