import 'package:flutter/foundation.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/get_popular_shows.dart';

class PopularShowsNotifier extends ChangeNotifier {
  PopularShowsNotifier(this.getPopularShows);

  final GetPopularShows getPopularShows;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Television> _televisionShows = [];
  List<Television> get televisionShows => _televisionShows;

  String _message = '';
  String get message => _message;

  Future<void> fetchPopularShows() async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getPopularShows();

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
