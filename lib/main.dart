import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common/constants.dart';
import 'common/utils.dart';
import 'injection.dart' as di;
import 'presentation/pages/about_page.dart';
import 'presentation/pages/home_movie_page.dart';
import 'presentation/pages/movie_detail_page.dart';
import 'presentation/pages/on_the_air_shows_page.dart';
import 'presentation/pages/popular_movies_page.dart';
import 'presentation/pages/popular_shows_page.dart';
import 'presentation/pages/search_page.dart';
import 'presentation/pages/television_detail_page.dart';
import 'presentation/pages/television_list_page.dart';
import 'presentation/pages/television_search_page.dart';
import 'presentation/pages/top_rated_movies_page.dart';
import 'presentation/pages/top_rated_shows_page.dart';
import 'presentation/pages/watchlist_movies_page.dart';
import 'presentation/pages/watchlist_shows_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await di.locator.allReady();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeMoviePage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const HomeMoviePage());
          case PopularMoviesPage.routeName:
            return CupertinoPageRoute(
                builder: (_) => const PopularMoviesPage());
          case TopRatedMoviesPage.routeName:
            return CupertinoPageRoute(
                builder: (_) => const TopRatedMoviesPage());
          case MovieDetailPage.routeName:
            final id = settings.arguments as int;
            return MaterialPageRoute(
              builder: (_) => MovieDetailPage(id: id),
              settings: settings,
            );
          case SearchPage.routeName:
            return CupertinoPageRoute(builder: (_) => const SearchPage());
          case WatchlistMoviesPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const WatchlistMoviesPage());
          case TelevisionListPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const TelevisionListPage());
          case OnTheAirShowsPage.routeName:
            return MaterialPageRoute(builder: (_) => const OnTheAirShowsPage());
          case PopularShowsPage.routeName:
            return MaterialPageRoute(builder: (_) => const PopularShowsPage());
          case TopRatedShowsPage.routeName:
            return MaterialPageRoute(builder: (_) => const TopRatedShowsPage());
          case TelevisionSearchPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const TelevisionSearchPage());
          case TelevisionDetailPage.routeName:
            return MaterialPageRoute(
              builder: (_) =>
                  TelevisionDetailPage(id: settings.arguments as int),
            );
          case WatchlistShowsPage.routeName:
            return MaterialPageRoute(
                builder: (_) => const WatchlistShowsPage());
          case AboutPage.routeName:
            return MaterialPageRoute(builder: (_) => const AboutPage());
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
