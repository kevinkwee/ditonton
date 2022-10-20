import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/constants.dart';
import '../../domain/entities/television.dart';
import '../../injection.dart';
import '../bloc/data_getter/data_getter_bloc.dart';
import '../bloc/on_the_air_television/on_the_air_television_bloc.dart';
import '../bloc/popular_television/popular_television_bloc.dart';
import '../bloc/top_rated_television/top_rated_television_bloc.dart';
import '../widgets/list_page_sub_heading.dart';
import 'on_the_air_shows_page.dart';
import 'popular_shows_page.dart';
import 'television_detail_page.dart';
import 'television_search_page.dart';
import 'top_rated_shows_page.dart';

class TelevisionListPage extends StatelessWidget {
  const TelevisionListPage({super.key});

  static const routeName = '/television-list';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<OnTheAirTelevisionBloc>()
            ..add(DataGetterEvent.requested(NoParam())),
        ),
        BlocProvider(
          create: (context) => locator<PopularTelevisionBloc>()
            ..add(DataGetterEvent.requested(NoParam())),
        ),
        BlocProvider(
          create: (context) => locator<TopRatedTelevisionBloc>()
            ..add(DataGetterEvent.requested(NoParam())),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TV Shows'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () =>
                  Navigator.pushNamed(context, TelevisionSearchPage.routeName),
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
          ListPageSubHeading(
            title: 'On The Air',
            onTap: () =>
                Navigator.pushNamed(context, OnTheAirShowsPage.routeName),
          ),
          BlocBuilder<OnTheAirTelevisionBloc,
              DataGetterState<List<Television>>>(
            builder: (context, state) {
              return state.maybeWhen(
                loadSuccess: (televisions) =>
                    _TelevisionHorizontalList(televisions),
                loadFailure: (message) => Center(
                  child: Text(message),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          ListPageSubHeading(
            title: 'Popular',
            onTap: () =>
                Navigator.pushNamed(context, PopularShowsPage.routeName),
          ),
          BlocBuilder<PopularTelevisionBloc, DataGetterState<List<Television>>>(
            builder: (context, state) {
              return state.maybeWhen(
                loadSuccess: (televisions) =>
                    _TelevisionHorizontalList(televisions),
                loadFailure: (message) => Center(
                  child: Text(message),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
          ListPageSubHeading(
            title: 'Top Rated',
            onTap: () =>
                Navigator.pushNamed(context, TopRatedShowsPage.routeName),
          ),
          BlocBuilder<TopRatedTelevisionBloc,
              DataGetterState<List<Television>>>(
            builder: (context, state) {
              return state.maybeWhen(
                loadSuccess: (televisions) =>
                    _TelevisionHorizontalList(televisions),
                loadFailure: (message) => Center(
                  child: Text(message),
                ),
                orElse: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ],
      ),
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
                  TelevisionDetailPage.routeName,
                  arguments: tvShow.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${tvShow.posterPath}',
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
