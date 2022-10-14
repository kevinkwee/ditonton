import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television_detail.dart';
import '../../repositories/television_repository.dart';

class TelevisionDeleteWatchlist {
  const TelevisionDeleteWatchlist(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, String>> call(TelevisionDetail televisionDetail) {
    return repository.deleteWatchlist(televisionDetail);
  }
}