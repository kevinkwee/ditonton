import 'package:equatable/equatable.dart';

class Television extends Equatable {
  const Television({
    required this.id,
    required this.name,
    required this.originalName,
    required this.popularity,
    required this.overview,
    required this.genreIds,
    required this.firstAirDate,
    required this.originCountry,
    required this.originalLanguage,
    required this.voteAverage,
    required this.voteCount,
    required this.posterPath,
    required this.backdropPath,
  });

  final int id;
  final String name;
  final String originalName;
  final double popularity;
  final String overview;
  final List<int> genreIds;
  final String firstAirDate;
  final List<String> originCountry;
  final String originalLanguage;
  final double voteAverage;
  final int voteCount;
  final String posterPath;
  final String backdropPath;

  @override
  List<Object?> get props => [
        id,
        name,
        originalName,
        popularity,
        overview,
        genreIds,
        firstAirDate,
        originCountry,
        originalLanguage,
        voteAverage,
        voteCount,
        posterPath,
        backdropPath,
      ];
}
