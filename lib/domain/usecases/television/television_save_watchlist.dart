import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television_detail.dart';
import '../../repositories/television_repository.dart';

class TelevisionSaveWatchlist {
  const TelevisionSaveWatchlist(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, String>> call(TelevisionDetail televisionDetail) {
    return repository.saveWatchlist(televisionDetail);
  }
}
