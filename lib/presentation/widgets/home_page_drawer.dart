import 'package:flutter/material.dart';
import 'package:movie/movie.dart';
import 'package:television/television.dart';

import '../pages/about_page.dart';

class HomePageDrawer extends StatelessWidget {
  const HomePageDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.tv_rounded),
            title: const Text('TV Shows'),
            onTap: () {
              Navigator.pushNamed(context, TelevisionListPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistMoviesPage.routeName);
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('TV Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, WatchlistShowsPage.routeName);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AboutPage.routeName);
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }
}
