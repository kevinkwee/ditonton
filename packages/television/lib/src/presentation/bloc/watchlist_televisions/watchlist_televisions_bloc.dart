import 'package:core/core.dart' show DataGetterBloc, Failure, NoParam;
import 'package:dartz/dartz.dart';

import '../../../domain/entities/television_watchlist.dart';
import '../../../domain/usecases/get_television_watchlist.dart';

class WatchlistTelevisionsBloc
    extends DataGetterBloc<List<TelevisionWatchlist>, NoParam> {
  WatchlistTelevisionsBloc(this.getTelevisionWatchlist);

  final GetTelevisionWatchlist getTelevisionWatchlist;

  @override
  Future<Either<Failure, List<TelevisionWatchlist>>> fetchData(NoParam params) {
    return getTelevisionWatchlist();
  }
}
