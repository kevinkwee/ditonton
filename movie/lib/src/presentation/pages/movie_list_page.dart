import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/now_playing_movies/now_playing_movies_bloc.dart';
import '../bloc/popular_movies/popular_movies_bloc.dart';
import '../bloc/top_rated_movies/top_rated_movies_bloc.dart';
import 'movie_detail_page.dart';
import 'popular_movies_page.dart';
import 'search_page.dart';
import 'top_rated_movies_page.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({
    super.key,
    required this.drawer,
  });

  final Widget drawer;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<NowPlayingMoviesBloc>()
            ..add(DataGetterEvent.requested(NoParam())),
        ),
        BlocProvider(
          create: (context) => locator<PopularMoviesBloc>()
            ..add(DataGetterEvent.requested(NoParam())),
        ),
        BlocProvider(
          create: (context) => locator<TopRatedMoviesBloc>()
            ..add(DataGetterEvent.requested(NoParam())),
        ),
      ],
      child: Scaffold(
        drawer: drawer,
        appBar: AppBar(
          title: const Text('Ditonton'),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SearchPage.routeName);
              },
              icon: const Icon(Icons.search),
            )
          ],
        ),
        body: const _HomeMoviePageBody(),
      ),
    );
  }
}

class _HomeMoviePageBody extends StatelessWidget {
  const _HomeMoviePageBody();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Now Playing',
            style: kHeading6,
          ),
          BlocBuilder<NowPlayingMoviesBloc, DataGetterState<List<Movie>>>(
            builder: (context, state) {
              return state.maybeWhen(
                loadSuccess: (movies) => _MovieHorizontalList(movies),
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
                Navigator.pushNamed(context, PopularMoviesPage.routeName),
          ),
          BlocBuilder<PopularMoviesBloc, DataGetterState<List<Movie>>>(
            builder: (context, state) {
              return state.maybeWhen(
                loadSuccess: (movies) => _MovieHorizontalList(movies),
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
                Navigator.pushNamed(context, TopRatedMoviesPage.routeName),
          ),
          BlocBuilder<TopRatedMoviesBloc, DataGetterState<List<Movie>>>(
            builder: (context, state) {
              return state.maybeWhen(
                loadSuccess: (movies) => _MovieHorizontalList(movies),
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

class _MovieHorizontalList extends StatelessWidget {
  final List<Movie> movies;

  const _MovieHorizontalList(this.movies);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MovieDetailPage.routeName,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
