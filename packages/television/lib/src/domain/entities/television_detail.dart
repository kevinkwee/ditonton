import 'package:core/core.dart' show Genre;
import 'package:equatable/equatable.dart';

import 'television_season.dart';

class TelevisionDetail extends Equatable {
  const TelevisionDetail({
    required this.id,
    required this.name,
    required this.overview,
    required this.backdropPath,
    required this.posterPath,
    required this.firstAirDate,
    required this.episodeRuntime,
    required this.genres,
    required this.seasons,
    required this.voteAverage,
    required this.voteCount,
  });

  final int id;
  final String name;
  final String overview;
  final String backdropPath;
  final String posterPath;
  final String firstAirDate;
  final List<int> episodeRuntime;
  final List<Genre> genres;
  final List<TelevisionSeason> seasons;
  final double voteAverage;
  final int voteCount;

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        backdropPath,
        posterPath,
        firstAirDate,
        episodeRuntime,
        genres,
        seasons,
        voteAverage,
        voteCount,
      ];
}
