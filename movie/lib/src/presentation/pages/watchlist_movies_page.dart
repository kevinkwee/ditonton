import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/watchlist_movies/watchlist_movies_bloc.dart';
import '../widgets/movie_card_list.dart';

class WatchlistMoviesPage extends StatelessWidget {
  const WatchlistMoviesPage({super.key});

  static const routeName = '/watchlist-movie';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<WatchlistMoviesBloc>()
        ..add(DataGetterEvent.requested(NoParam())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
        ),
        body: const _WatchlistMoviesPageBody(),
      ),
    );
  }
}

class _WatchlistMoviesPageBody extends StatefulWidget {
  const _WatchlistMoviesPageBody();

  @override
  State<_WatchlistMoviesPageBody> createState() =>
      __WatchlistMoviesPageBodyState();
}

class __WatchlistMoviesPageBodyState extends State<_WatchlistMoviesPageBody>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context
        .read<WatchlistMoviesBloc>()
        .add(DataGetterEvent.requested(NoParam()));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<WatchlistMoviesBloc, DataGetterState<List<Movie>>>(
        builder: (context, state) {
          return state.maybeWhen(
            loadSuccess: (movies) {
              if (movies.isEmpty) {
                return const Center(
                  child: Text('Empty Watchlist'),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return MovieCard(movie);
                },
                itemCount: movies.length,
              );
            },
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
