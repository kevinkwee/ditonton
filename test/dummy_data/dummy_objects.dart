import 'package:ditonton/data/models/genre_model.dart';
import 'package:ditonton/data/models/movie_table.dart';
import 'package:ditonton/data/models/television_detail_model.dart';
import 'package:ditonton/data/models/television_model.dart';
import 'package:ditonton/data/models/television_season_model.dart';
import 'package:ditonton/data/models/television_watchlist_model.dart';
import 'package:ditonton/domain/entities/genre.dart';
import 'package:ditonton/domain/entities/movie.dart';
import 'package:ditonton/domain/entities/movie_detail.dart';
import 'package:ditonton/domain/entities/television.dart';
import 'package:ditonton/domain/entities/television_detail.dart';
import 'package:ditonton/domain/entities/television_season.dart';
import 'package:ditonton/domain/entities/television_watchlist.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: const [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testMovieList = [testMovie];

const testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

const testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

const testTelevision = Television(
  id: 62425,
  name: 'Dark Matter',
  originalName: 'Dark Matter',
  popularity: 7.234674,
  overview:
      'The six-person crew of a derelict spaceship awakens from stasis in the farthest reaches of space. Their memories wiped clean, they have no recollection of who they are or how they got on board. The only clue to their identities is a cargo bay full of weaponry and a destination: a remote mining colony that is about to become a war zone. With no idea whose side they are on, they face a deadly decision. Will these amnesiacs turn their backs on history, or will their pasts catch up with them?',
  genreIds: [878, 18, 53],
  firstAirDate: '2015-06-12',
  originCountry: ["CA"],
  originalLanguage: 'en',
  voteAverage: 5.78,
  voteCount: 86,
  posterPath: '/iDSXueb3hjerXMq5w92rBP16LWY.jpg',
  backdropPath: '/kohPYEYHuQLWX3gjchmrWWOEycD.jpg',
);

const testTelevisionList = [testTelevision];

const testTelevisionModel = TelevisionModel(
  id: 62425,
  name: 'Dark Matter',
  originalName: 'Dark Matter',
  popularity: 7.234674,
  overview:
      'The six-person crew of a derelict spaceship awakens from stasis in the farthest reaches of space. Their memories wiped clean, they have no recollection of who they are or how they got on board. The only clue to their identities is a cargo bay full of weaponry and a destination: a remote mining colony that is about to become a war zone. With no idea whose side they are on, they face a deadly decision. Will these amnesiacs turn their backs on history, or will their pasts catch up with them?',
  genreIds: [878, 18, 53],
  firstAirDate: '2015-06-12',
  originCountry: ["CA"],
  originalLanguage: 'en',
  voteAverage: 5.78,
  voteCount: 86,
  posterPath: '/iDSXueb3hjerXMq5w92rBP16LWY.jpg',
  backdropPath: '/kohPYEYHuQLWX3gjchmrWWOEycD.jpg',
);

const testTelevisionModelList = [testTelevisionModel];

const testTelevisionSeason = TelevisionSeason(
  id: 3624,
  name: 'Season 1',
  overview:
      'Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros\' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.',
  posterPath: '/zwaj4egrhnXOBIit1tyb4Sbt3KP.jpg',
  airDate: '2011-04-17',
  episodeCount: 10,
  seasonNumber: 1,
);

const testTelevisionSeasonList = [testTelevisionSeason];

const testTelevisionSeasonModel = TelevisionSeasonModel(
  id: 3624,
  name: 'Season 1',
  overview:
      'Trouble is brewing in the Seven Kingdoms of Westeros. For the driven inhabitants of this visionary world, control of Westeros\' Iron Throne holds the lure of great power. But in a land where the seasons can last a lifetime, winter is coming...and beyond the Great Wall that protects them, an ancient evil has returned. In Season One, the story centers on three primary areas: the Stark and the Lannister families, whose designs on controlling the throne threaten a tenuous peace; the dragon princess Daenerys, heir to the former dynasty, who waits just over the Narrow Sea with her malevolent brother Viserys; and the Great Wall--a massive barrier of ice where a forgotten danger is stirring.',
  posterPath: '/zwaj4egrhnXOBIit1tyb4Sbt3KP.jpg',
  airDate: '2011-04-17',
  episodeCount: 10,
  seasonNumber: 1,
);

const testTelevisionSeasonModelList = [testTelevisionSeasonModel];

const testTelevisionDetail = TelevisionDetail(
  id: 1399,
  name: 'Game of Thrones',
  overview:
      'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.',
  backdropPath: '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  firstAirDate: '2011-04-17',
  episodeRuntime: [60],
  genres: [
    Genre(
      id: 10765,
      name: 'Sci-Fi & Fantasy',
    ),
  ],
  seasons: testTelevisionSeasonList,
  voteAverage: 8.3,
  voteCount: 11504,
);

const testTelevisionDetailModel = TelevisionDetailModel(
  id: 1399,
  name: 'Game of Thrones',
  overview:
      'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.',
  backdropPath: '/suopoADq0k8YZr4dQXcU6pToj6s.jpg',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
  firstAirDate: '2011-04-17',
  episodeRuntime: [60],
  genres: [
    GenreModel(
      id: 10765,
      name: 'Sci-Fi & Fantasy',
    ),
  ],
  seasons: testTelevisionSeasonModelList,
  voteAverage: 8.3,
  voteCount: 11504,
);

const testTelevisionWatchlistJson = {
  'id': 1399,
  'name': 'Game of Thrones',
  'overview':
      'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.',
  'posterPath': '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
};

const testTelevisionWatchlist = TelevisionWatchlist(
  id: 1399,
  name: 'Game of Thrones',
  overview:
      'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
);

const testTelevisionWatchlistModel = TelevisionWatchlistModel(
  id: 1399,
  name: 'Game of Thrones',
  overview:
      'Seven noble families fight for control of the mythical land of Westeros. Friction between the houses leads to full-scale war. All while a very ancient evil awakens in the farthest north. Amidst the war, a neglected military order of misfits, the Night\'s Watch, is all that stands between the realms of men and icy horrors beyond.',
  posterPath: '/u3bZgnGQ9T01sWNhyveQz0wH0Hl.jpg',
);
