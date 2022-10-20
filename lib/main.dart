import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie/movie.dart' as movie;
import 'package:television/television.dart' as tv;

import 'presentation/pages/about_page.dart';
import 'presentation/widgets/home_page_drawer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  movie.init();
  tv.init();
  await GetIt.instance.allReady();
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
      home: const movie.MovieListPage(drawer: HomePageDrawer()),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        Route? route;

        switch (settings.name) {
          case '/home':
            route = MaterialPageRoute(
                builder: (_) => const movie.MovieListPage(
                      drawer: HomePageDrawer(),
                    ));
            break;
          case AboutPage.routeName:
            route = MaterialPageRoute(builder: (_) => const AboutPage());
            break;
          default:
            route = movie.handleOnGenerateRoute(settings) ??
                tv.handleOnGenerateRoute(settings);
            route ??= MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }

        return route;
      },
    );
  }
}
