import '../../repositories/television_repository.dart';

class GetTelevisionWatchlistStatus {
  const GetTelevisionWatchlistStatus(this.repository);

  final TelevisionRepository repository;

  Future<bool> call(int id) {
    return repository.isAddedToWatchlist(id);
  }
}
