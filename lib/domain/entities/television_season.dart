import 'package:equatable/equatable.dart';

class TelevisionSeason extends Equatable {
  const TelevisionSeason({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
    required this.airDate,
    required this.episodeCount,
    required this.seasonNumber,
  });

  final int id;
  final String name;
  final String overview;
  final String posterPath;
  final String airDate;
  final int episodeCount;
  final int seasonNumber;

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        posterPath,
        airDate,
        episodeCount,
        seasonNumber,
      ];
}
