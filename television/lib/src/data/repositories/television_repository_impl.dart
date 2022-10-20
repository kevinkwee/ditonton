import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

import '../../domain/entities/television.dart';
import '../../domain/entities/television_detail.dart';
import '../../domain/entities/television_watchlist.dart';
import '../../domain/repositories/television_repository.dart';
import '../datasources/television_local_data_source.dart';
import '../datasources/television_remote_data_source.dart';
import '../models/television_watchlist_model.dart';

class TelevisionRepositoryImpl implements TelevisionRepository {
  TelevisionRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final TelevisionRemoteDataSource remoteDataSource;
  final TelevisionLocalDataSource localDataSource;

  @override
  Future<Either<Failure, List<Television>>> getOnTheAirShows() async {
    try {
      final result = await remoteDataSource.getOnTheAirShows();
      return right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return left(const ServerFailure(''));
    } on SocketException {
      return left(const ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Television>>> getPopularShows() async {
    try {
      final result = await remoteDataSource.getPopularShows();
      return right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return left(const ServerFailure(''));
    } on SocketException {
      return left(const ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Television>>> getTopRatedShows() async {
    try {
      final result = await remoteDataSource.getTopRatedShows();
      return right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return left(const ServerFailure(''));
    } on SocketException {
      return left(const ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Television>>> searchShows(String query) async {
    try {
      final result = await remoteDataSource.searchShows(query);
      return right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return left(const ServerFailure(''));
    } on SocketException {
      return left(const ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, TelevisionDetail>> getShowDetail(int id) async {
    try {
      final result = await remoteDataSource.getShowDetail(id);
      return right(result.toEntity());
    } on ServerException {
      return left(const ServerFailure(''));
    } on SocketException {
      return left(const ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, List<Television>>> getShowRecommendations(
    int id,
  ) async {
    try {
      final result = await remoteDataSource.getShowRecommendations(id);
      return right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return left(const ServerFailure(''));
    } on SocketException {
      return left(const ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<bool> isAddedToWatchlist(int id) async {
    final result = await localDataSource.getTelevisionById(id);
    return result != null;
  }

  @override
  Future<Either<Failure, List<TelevisionWatchlist>>>
      getTelevisionWatchlist() async {
    final result = await localDataSource.getTelevisionWatchlist();
    return right(result.map((model) => model.toEntity()).toList());
  }

  @override
  Future<Either<Failure, String>> deleteWatchlist(
    TelevisionDetail televisionDetail,
  ) async {
    try {
      final result = await localDataSource.removeWatchlist(
        TelevisionWatchlistModel.fromTelevisionDetailEntity(televisionDetail),
      );
      return right(result);
    } on DatabaseException catch (e) {
      return left(DatabaseFailure(e.message));
    }
  }

  @override
  Future<Either<Failure, String>> saveWatchlist(
    TelevisionDetail televisionDetail,
  ) async {
    try {
      final result = await localDataSource.insertWatchlist(
        TelevisionWatchlistModel.fromTelevisionDetailEntity(televisionDetail),
      );
      return right(result);
    } on DatabaseException catch (e) {
      return left(DatabaseFailure(e.message));
    } catch (e) {
      rethrow;
    }
  }
}
