import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../entities/television_detail.dart';
import '../../repositories/television_repository.dart';

class GetShowDetail {
  const GetShowDetail(this.repository);

  final TelevisionRepository repository;

  Future<Either<Failure, TelevisionDetail>> call(int id) async {
    return await repository.getShowDetail(id);
  }
}
