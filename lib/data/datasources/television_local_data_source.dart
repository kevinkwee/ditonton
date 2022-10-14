import '../../common/exception.dart';
import '../models/television_watchlist_model.dart';
import 'db/television_database_helper.dart';

abstract class TelevisionLocalDataSource {
  Future<String> insertWatchlist(
      TelevisionWatchlistModel televisionWatchlistModel);
  Future<String> removeWatchlist(
      TelevisionWatchlistModel televisionWatchlistModel);
  Future<TelevisionWatchlistModel?> getTelevisionById(int id);
  Future<List<TelevisionWatchlistModel>> getTelevisionWatchlist();
}

class TelevisionLocalDataSourceImpl implements TelevisionLocalDataSource {
  const TelevisionLocalDataSourceImpl({required this.databaseHelper});

  final TelevisionDatabaseHelper databaseHelper;

  @override
  Future<TelevisionWatchlistModel?> getTelevisionById(int id) async {
    final result = await databaseHelper.getTelevisionById(id);
    if (result != null) {
      return TelevisionWatchlistModel.fromJson(result);
    }
    return null;
  }

  @override
  Future<List<TelevisionWatchlistModel>> getTelevisionWatchlist() async {
    final result = await databaseHelper.getTelevisionWatchlist();
    return result.map((e) => TelevisionWatchlistModel.fromJson(e)).toList();
  }

  @override
  Future<String> insertWatchlist(
    TelevisionWatchlistModel televisionWatchlistModel,
  ) async {
    try {
      await databaseHelper.insertWatchlist(televisionWatchlistModel);
      return 'Added to Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }

  @override
  Future<String> removeWatchlist(
    TelevisionWatchlistModel televisionWatchlistModel,
  ) async {
    try {
      await databaseHelper.removeWatchlist(televisionWatchlistModel);
      return 'Removed from Watchlist';
    } catch (e) {
      throw DatabaseException(e.toString());
    }
  }
}
