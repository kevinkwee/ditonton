import 'package:dartz/dartz.dart';

import '../../../common/failure.dart';
import '../../../domain/entities/television_watchlist.dart';
import '../../../domain/usecases/television/get_television_watchlist.dart';
import '../data_getter/data_getter_bloc.dart';

class WatchlistTelevisionsBloc
    extends DataGetterBloc<List<TelevisionWatchlist>, NoParam> {
  WatchlistTelevisionsBloc(this.getTelevisionWatchlist);

  final GetTelevisionWatchlist getTelevisionWatchlist;

  @override
  Future<Either<Failure, List<TelevisionWatchlist>>> fetchData(NoParam params) {
    return getTelevisionWatchlist();
  }
}
