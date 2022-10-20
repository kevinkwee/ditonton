import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/popular_movies/popular_movies_bloc.dart';
import '../widgets/movie_card_list.dart';

class PopularMoviesPage extends StatelessWidget {
  const PopularMoviesPage({super.key});

  static const routeName = '/popular-movie';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<PopularMoviesBloc>()
        ..add(DataGetterEvent.requested(NoParam())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Popular Movies'),
        ),
        body: const _PopularMoviesPageBody(),
      ),
    );
  }
}

class _PopularMoviesPageBody extends StatelessWidget {
  const _PopularMoviesPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<PopularMoviesBloc, DataGetterState<List<Movie>>>(
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
