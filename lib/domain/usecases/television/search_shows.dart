import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television.dart';
import '../../repositories/television_repository.dart';

class SearchShows {
  const SearchShows(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, List<Television>>> call(String query) async {
    return await repository.searchShows(query);
  }
}
