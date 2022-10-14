import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television.dart';
import '../../repositories/television_repository.dart';

class GetTopRatedShows {
  const GetTopRatedShows(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, List<Television>>> call() async {
    return await repository.getTopRatedShows();
  }
}
