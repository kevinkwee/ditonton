import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'presentation/pages/movie_detail_page.dart';
import 'presentation/pages/popular_movies_page.dart';
import 'presentation/pages/search_page.dart';
import 'presentation/pages/top_rated_movies_page.dart';
import 'presentation/pages/watchlist_movies_page.dart';

Route<dynamic>? handleOnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case PopularMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => const PopularMoviesPage());
    case TopRatedMoviesPage.routeName:
      return CupertinoPageRoute(builder: (_) => const TopRatedMoviesPage());
    case MovieDetailPage.routeName:
      final id = settings.arguments as int;
      return MaterialPageRoute(
        builder: (_) => MovieDetailPage(id: id),
        settings: settings,
      );
    case SearchPage.routeName:
      return CupertinoPageRoute(builder: (_) => const SearchPage());
    case WatchlistMoviesPage.routeName:
      return MaterialPageRoute(builder: (_) => const WatchlistMoviesPage());
    default:
      return null;
  }
}
