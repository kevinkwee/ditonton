import 'package:flutter/foundation.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/get_top_rated_shows.dart';

class TopRatedShowsNotifier extends ChangeNotifier {
  TopRatedShowsNotifier(this.getTopRatedShows);

  final GetTopRatedShows getTopRatedShows;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Television> _televisionShows = [];
  List<Television> get televisionShows => _televisionShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchTopRatedShows() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getTopRatedShows();

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (televisionShows) {
        _televisionShows = televisionShows;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
