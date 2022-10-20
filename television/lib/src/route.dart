import 'package:flutter/material.dart';

import 'presentation/pages/on_the_air_shows_page.dart';
import 'presentation/pages/popular_shows_page.dart';
import 'presentation/pages/television_detail_page.dart';
import 'presentation/pages/television_list_page.dart';
import 'presentation/pages/television_search_page.dart';
import 'presentation/pages/top_rated_shows_page.dart';
import 'presentation/pages/watchlist_shows_page.dart';

Route<dynamic>? handleOnGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case TelevisionListPage.routeName:
      return MaterialPageRoute(builder: (_) => const TelevisionListPage());
    case OnTheAirShowsPage.routeName:
      return MaterialPageRoute(builder: (_) => const OnTheAirShowsPage());
    case PopularShowsPage.routeName:
      return MaterialPageRoute(builder: (_) => const PopularShowsPage());
    case TopRatedShowsPage.routeName:
      return MaterialPageRoute(builder: (_) => const TopRatedShowsPage());
    case TelevisionSearchPage.routeName:
      return MaterialPageRoute(builder: (_) => const TelevisionSearchPage());
    case TelevisionDetailPage.routeName:
      return MaterialPageRoute(
        builder: (_) => TelevisionDetailPage(id: settings.arguments as int),
      );
    case WatchlistShowsPage.routeName:
      return MaterialPageRoute(builder: (_) => const WatchlistShowsPage());
    default:
      return null;
  }
}
