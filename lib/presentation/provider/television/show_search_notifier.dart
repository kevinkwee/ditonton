import 'package:flutter/foundation.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/usecases/television/search_shows.dart';

class ShowSearchNotifier extends ChangeNotifier {
  ShowSearchNotifier(this.searchShows);

  final SearchShows searchShows;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  List<Television> _searchResults = [];
  List<Television> get searchResults => _searchResults;

  String _message = '';
  String get message => _message;

  Future<void> fetchShowSearch(String query) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await searchShows(query);

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (searchResults) {
        _searchResults = searchResults;
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }
}
