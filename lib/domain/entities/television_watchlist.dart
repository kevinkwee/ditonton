import 'package:equatable/equatable.dart';

class TelevisionWatchlist extends Equatable {
  const TelevisionWatchlist({
    required this.id,
    required this.name,
    required this.overview,
    required this.posterPath,
  });

  final int id;
  final String name;
  final String overview;
  final String posterPath;

  @override
  List<Object?> get props => [
        id,
        name,
        overview,
        posterPath,
      ];
}
