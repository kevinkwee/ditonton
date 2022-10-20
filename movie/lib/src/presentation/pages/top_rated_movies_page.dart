import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/top_rated_movies/top_rated_movies_bloc.dart';
import '../widgets/movie_card_list.dart';

class TopRatedMoviesPage extends StatelessWidget {
  const TopRatedMoviesPage({super.key});

  static const routeName = '/top-rated-movie';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TopRatedMoviesBloc>()
        ..add(DataGetterEvent.requested(NoParam())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Rated Movies'),
        ),
        body: const _TopRatedMoviesPageBody(),
      ),
    );
  }
}

class _TopRatedMoviesPageBody extends StatelessWidget {
  const _TopRatedMoviesPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<TopRatedMoviesBloc, DataGetterState<List<Movie>>>(
        builder: (context, state) {
          return state.maybeWhen(
            loadSuccess: (movies) => ListView.builder(
              itemBuilder: (context, index) {
                final movie = movies[index];
                return MovieCard(movie);
              },
              itemCount: movies.length,
            ),
            loadFailure: (message) => Center(
              key: const Key('error_message'),
              child: Text(message),
            ),
            orElse: () => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
