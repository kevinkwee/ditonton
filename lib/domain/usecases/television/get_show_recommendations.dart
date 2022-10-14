import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television.dart';
import '../../repositories/television_repository.dart';

class GetShowRecommendations {
  const GetShowRecommendations(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, List<Television>>> call(int id) {
    return repository.getShowRecommendations(id);
  }
}
