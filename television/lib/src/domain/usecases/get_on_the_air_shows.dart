import 'package:core/core.dart' show Failure;
import 'package:dartz/dartz.dart';

import '../entities/television.dart';
import '../repositories/television_repository.dart';

class GetOnTheAirShows {
  const GetOnTheAirShows(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, List<Television>>> call() async {
    return await repository.getOnTheAirShows();
  }
}
