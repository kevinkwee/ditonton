import 'package:equatable/equatable.dart';

import '../../domain/entities/television_detail.dart';
import '../../domain/entities/television_watchlist.dart';

class TelevisionWatchlistModel extends Equatable {
  const TelevisionWatchlistModel({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  final int id;
  final String name;
  final String overview;
  final String posterPath;

  factory TelevisionWatchlistModel.fromJson(Map<String, dynamic> json) {
    return TelevisionWatchlistModel(
      id: json['id'],
      name: json['name'],
      overview: json['overview'],
      posterPath: json['posterPath'],
    );
  }

  factory TelevisionWatchlistModel.fromTelevisionDetailEntity(
    TelevisionDetail televisionDetail,
  ) {
    return TelevisionWatchlistModel(
      id: televisionDetail.id,
      name: televisionDetail.name,
      overview: televisionDetail.overview,
      posterPath: televisionDetail.posterPath,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'overview': overview,
        'posterPath': posterPath,
      };

  TelevisionWatchlist toEntity() => TelevisionWatchlist(
        id: id,
        name: name,
        overview: overview,
        posterPath: posterPath,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        posterPath,
      ];
}
