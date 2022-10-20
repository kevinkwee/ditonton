import '../../domain/entities/television.dart';

class TelevisionModel extends Television {
  const TelevisionModel({
    required super.id,
    required super.name,
    required super.originalName,
    required super.popularity,
    required super.overview,
    required super.genreIds,
    required super.firstAirDate,
    required super.originCountry,
    required super.originalLanguage,
    required super.voteAverage,
    required super.voteCount,
    required super.posterPath,
    required super.backdropPath,
  });

  factory TelevisionModel.fromJson(Map<String, dynamic> json) =>
      TelevisionModel(
        id: json['id'],
        name: json['name'],
        originalName: json['original_name'],
        popularity: json['popularity'].toDouble(),
        overview: json['overview'],
        genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
        firstAirDate: json['first_air_date'],
        originCountry: List<String>.from(json['origin_country'].map((e) => e)),
        originalLanguage: json['original_language'],
        voteAverage: json['vote_average'].toDouble(),
        voteCount: json['vote_count'],
        posterPath: json['poster_path'],
        backdropPath: json['backdrop_path'],
      );

  Television toEntity() => Television(
        id: id,
        name: name,
        originalName: originalName,
        popularity: popularity,
        overview: overview,
        genreIds: genreIds,
        firstAirDate: firstAirDate,
        originCountry: originCountry,
        originalLanguage: originalLanguage,
        voteAverage: voteAverage,
        voteCount: voteCount,
        posterPath: posterPath,
        backdropPath: backdropPath,
      );
}
