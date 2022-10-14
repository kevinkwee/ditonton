import 'package:equatable/equatable.dart';

import '../../domain/entities/television_detail.dart';
import 'genre_model.dart';
import 'television_season_model.dart';

class TelevisionDetailModel extends Equatable {
  const TelevisionDetailModel({
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
  final List<GenreModel> genres;
  final List<TelevisionSeasonModel> seasons;
  final double voteAverage;
  final int voteCount;

  factory TelevisionDetailModel.fromJson(Map<String, dynamic> json) =>
      TelevisionDetailModel(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        backdropPath: json['backdrop_path'],
        posterPath: json['poster_path'],
        firstAirDate: json['first_air_date'],
        episodeRuntime:
            (json['episode_run_time'] as List).map<int>((e) => e).toList(),
        genres: (json['genres'] as List)
            .map((genre) => GenreModel.fromJson(genre))
            .toList(),
        seasons: (json['seasons'] as List)
            .map((season) => TelevisionSeasonModel.fromJson(season))
            .toList(),
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
      );

  TelevisionDetail toEntity() => TelevisionDetail(
        id: id,
        name: name,
        overview: overview,
        backdropPath: backdropPath,
        posterPath: posterPath,
        firstAirDate: firstAirDate,
        episodeRuntime: episodeRuntime,
        genres: genres.map((genre) => genre.toEntity()).toList(),
        seasons: seasons.map((season) => season.toEntity()).toList(),
        voteAverage: voteAverage,
        voteCount: voteCount,
      );

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
