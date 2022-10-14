import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';
import '../../domain/entities/television.dart';
import '../../injection.dart' as di;
import '../provider/television/on_the_air_shows_notifier.dart';
import '../provider/television/popular_shows_notifier.dart';
import '../provider/television/top_rated_shows_notifier.dart';
import 'on_the_air_shows_page.dart';
import 'popular_shows_page.dart';
import 'television_detail_page.dart';
import 'television_search_page.dart';
import 'top_rated_shows_page.dart';

class TelevisionListPage extends StatelessWidget {
  const TelevisionListPage({super.key});

  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/television-list';

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) =>
              di.locator<OnTheAirShowsNotifier>()..fetchOnTheAirShows(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              di.locator<PopularShowsNotifier>()..fetchPopularShows(),
        ),
        ChangeNotifierProvider(
          create: (_) =>
              di.locator<TopRatedShowsNotifier>()..fetchTopRatedShows(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TV Shows'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  Navigator.pushNamed(context, TelevisionSearchPage.ROUTE_NAME),
            ),
          ],
        ),
        body: const _TelevisionListBody(),
      ),
    );
  }
}

class _TelevisionListBody extends StatelessWidget {
  const _TelevisionListBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          _SubHeading(
            title: 'On The Air',
            onTap: () =>
                Navigator.pushNamed(context, OnTheAirShowsPage.ROUTE_NAME),
          ),
          Consumer<OnTheAirShowsNotifier>(
            builder: (context, value, child) {
              final state = value.state;
              if (state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return _TelevisionHorizontalList(value.televisionShows);
              } else {
                return const Text('Failed');
              }
            },
          ),
          _SubHeading(
            title: 'Popular',
            onTap: () =>
                Navigator.pushNamed(context, PopularShowsPage.ROUTE_NAME),
          ),
          Consumer<PopularShowsNotifier>(
            builder: (context, value, child) {
              final state = value.state;
              if (state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return _TelevisionHorizontalList(value.televisionShows);
              } else {
                return const Text('Failed');
              }
            },
          ),
          _SubHeading(
            title: 'Top Rated',
            onTap: () =>
                Navigator.pushNamed(context, TopRatedShowsPage.ROUTE_NAME),
          ),
          Consumer<TopRatedShowsNotifier>(
            builder: (context, value, child) {
              final state = value.state;
              if (state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == RequestState.Loaded) {
                return _TelevisionHorizontalList(value.televisionShows);
              } else {
                return const Text('Failed');
              }
            },
          ),
        ],
      ),
    );
  }
}

class _SubHeading extends StatelessWidget {
  const _SubHeading({
    required this.title,
    required this.onTap,
  });

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: kHeading6,
          ),
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('See More'),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TelevisionHorizontalList extends StatelessWidget {
  const _TelevisionHorizontalList(this.televisionShows);

  final List<Television> televisionShows;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: televisionShows.length,
        itemBuilder: (context, index) {
          final tvShow = televisionShows[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TelevisionDetailPage.ROUTE_NAME,
                  arguments: tvShow.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$BASE_IMAGE_URL${tvShow.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
