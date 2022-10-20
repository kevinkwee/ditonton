import 'package:core/core.dart' show Failure;
import 'package:dartz/dartz.dart';

import '../entities/television_detail.dart';
import '../repositories/television_repository.dart';

class GetShowDetail {
  const GetShowDetail(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, TelevisionDetail>> call(int id) async {
    return await repository.getShowDetail(id);
  }
}
