import 'package:flutter/widgets.dart';

import '../../../common/state_enum.dart';
import '../../../domain/entities/television.dart';
import '../../../domain/entities/television_detail.dart';
import '../../../domain/usecases/television/get_show_detail.dart';
import '../../../domain/usecases/television/get_show_recommendations.dart';
import '../../../domain/usecases/television/get_television_watchlist_status.dart';
import '../../../domain/usecases/television/television_delete_watchlist.dart';
import '../../../domain/usecases/television/television_save_watchlist.dart';

class ShowDetailNotifier extends ChangeNotifier {
  ShowDetailNotifier({
    required this.getShowDetail,
    required this.getShowRecommendations,
    required this.getTelevisionWatchlistStatus,
    required this.televisionSaveWatchlist,
    required this.televisionDeleteWatchlist,
  });

  static const watchlistAddSuccessMessage = 'Added to Watchlist';
  static const watchlistRemoveSuccessMessage = 'Removed from Watchlist';

  final GetShowDetail getShowDetail;
  final GetShowRecommendations getShowRecommendations;
  final GetTelevisionWatchlistStatus getTelevisionWatchlistStatus;
  final TelevisionSaveWatchlist televisionSaveWatchlist;
  final TelevisionDeleteWatchlist televisionDeleteWatchlist;

  RequestState _state = RequestState.Empty;
  RequestState get state => _state;

  late TelevisionDetail _televisionDetail;
  TelevisionDetail get televisionDetail => _televisionDetail;

  RequestState _recommendationState = RequestState.Empty;
  RequestState get recommendationState => _recommendationState;

  List<Television> _televisionRecommendations = [];
  List<Television> get televisionRecommendations => _televisionRecommendations;

  String _message = '';
  String get message => _message;

  bool _isAddedtoWatchlist = false;
  bool get isAddedToWatchlist => _isAddedtoWatchlist;

  String _watchlistMessage = '';
  String get watchlistMessage => _watchlistMessage;

  Future<void> fetchShowDetail(int id) async {
    _state = RequestState.Loading;
    notifyListeners();

    final result = await getShowDetail(id);
    final recommendationResult = await getShowRecommendations(id);

    result.fold(
      (failure) {
        _message = failure.message;
        _state = RequestState.Error;
        notifyListeners();
      },
      (televisionDetail) {
        _recommendationState = RequestState.Loading;
        _televisionDetail = televisionDetail;
        notifyListeners();
        recommendationResult.fold(
          (failure) {
            _recommendationState = RequestState.Error;
            _message = failure.message;
          },
          (televisions) {
            _recommendationState = RequestState.Loaded;
            _televisionRecommendations = televisions;
          },
        );
        _state = RequestState.Loaded;
        notifyListeners();
      },
    );
  }

  Future<void> addWatchlist(TelevisionDetail televisionDetail) async {
    final result = await televisionSaveWatchlist(televisionDetail);

    result.fold(
      (failure) {
        _watchlistMessage = failure.message;
      },
      (successMessage) {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(televisionDetail.id);
  }

  Future<void> removeWatchlist(TelevisionDetail televisionDetail) async {
    final result = await televisionDeleteWatchlist(televisionDetail);

    result.fold(
      (failure) {
        _watchlistMessage = failure.message;
      },
      (successMessage) {
        _watchlistMessage = successMessage;
      },
    );

    await loadWatchlistStatus(televisionDetail.id);
  }

  Future<void> loadWatchlistStatus(int id) async {
    final result = await getTelevisionWatchlistStatus(id);
    _isAddedtoWatchlist = result;
    notifyListeners();
  }
}
