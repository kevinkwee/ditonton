import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/movie.dart';
import '../bloc/movie_search/movie_search_bloc.dart';
import '../widgets/movie_card_list.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MovieSearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: const _SearchPageBody(),
      ),
    );
  }
}

class _SearchPageBody extends StatelessWidget {
  const _SearchPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            onSubmitted: (query) {
              context
                  .read<MovieSearchBloc>()
                  .add(DataGetterEvent.requested(query));
            },
            decoration: const InputDecoration(
              hintText: 'Search title',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.search,
          ),
          const SizedBox(height: 16),
          Text(
            'Search Result',
            style: kHeading6,
          ),
          BlocBuilder<MovieSearchBloc, DataGetterState<List<Movie>>>(
            builder: (context, state) {
              return state.when(
                initial: () => const Expanded(
                  child: Center(
                    child: Text('Search for movies'),
                  ),
                ),
                loadInProgress: () => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                loadSuccess: (movies) {
                  if (movies.isEmpty) {
                    return const Expanded(
                      child: Center(
                        child: Text('No Result'),
                      ),
                    );
                  }

                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final movie = movies[index];
                        return MovieCard(movie);
                      },
                      itemCount: movies.length,
                    ),
                  );
                },
                loadFailure: (message) => Expanded(
                  child: Center(
                    child: Text('Error: $message'),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
