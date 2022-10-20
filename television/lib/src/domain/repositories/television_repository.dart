import 'package:core/core.dart' show Failure;
import 'package:dartz/dartz.dart';

import '../entities/television.dart';
import '../entities/television_detail.dart';
import '../entities/television_watchlist.dart';

abstract class TelevisionRepository {
  Future<Either<Failure, List<Television>>> getOnTheAirShows();
  Future<Either<Failure, List<Television>>> getPopularShows();
  Future<Either<Failure, List<Television>>> getTopRatedShows();
  Future<Either<Failure, List<Television>>> getShowRecommendations(int id);
  Future<Either<Failure, TelevisionDetail>> getShowDetail(int id);
  Future<Either<Failure, List<Television>>> searchShows(String query);
  Future<bool> isAddedToWatchlist(int id);
  Future<Either<Failure, String>> saveWatchlist(
    TelevisionDetail televisionDetail,
  );
  Future<Either<Failure, String>> deleteWatchlist(
    TelevisionDetail televisionDetail,
  );
  Future<Either<Failure, List<TelevisionWatchlist>>> getTelevisionWatchlist();
}
