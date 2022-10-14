import '../../domain/entities/television_season.dart';

class TelevisionSeasonModel extends TelevisionSeason {
  const TelevisionSeasonModel({
    required super.id,
    required super.name,
    required super.overview,
    required super.posterPath,
    required super.airDate,
    required super.episodeCount,
    required super.seasonNumber,
  });

  factory TelevisionSeasonModel.fromJson(Map<String, dynamic> json) =>
      TelevisionSeasonModel(
        id: json['id'],
        name: json['name'],
        overview: json['overview'],
        posterPath: json['poster_path'] ?? '',
        airDate: json['air_date'] ?? '',
        episodeCount: json['episode_count'],
        seasonNumber: json['season_number'],
      );

  TelevisionSeason toEntity() => TelevisionSeason(
        id: id,
        name: name,
        overview: overview,
        posterPath: posterPath,
        airDate: airDate,
        episodeCount: episodeCount,
        seasonNumber: seasonNumber,
      );
}
