import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television.dart';
import '../../repositories/television_repository.dart';

class GetPopularShows {
  const GetPopularShows(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, List<Television>>> call() {
    return repository.getPopularShows();
  }
}
