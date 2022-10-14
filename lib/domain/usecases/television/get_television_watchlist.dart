import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television_watchlist.dart';
import '../../repositories/television_repository.dart';

class GetTelevisionWatchlist {
  const GetTelevisionWatchlist(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, List<TelevisionWatchlist>>> call() {
    return repository.getTelevisionWatchlist();
  }
}
