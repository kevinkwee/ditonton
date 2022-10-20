import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/television.dart';
import '../bloc/television_search/television_search_bloc.dart';
import '../widgets/television_card.dart';

class TelevisionSearchPage extends StatelessWidget {
  static const routeName = '/tv-search';

  const TelevisionSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TelevisionSearchBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TV Search'),
        ),
        body: const _TelevisionSearchPageBody(),
      ),
    );
  }
}

class _TelevisionSearchPageBody extends StatelessWidget {
  const _TelevisionSearchPageBody();

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
                  .read<TelevisionSearchBloc>()
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
          BlocBuilder<TelevisionSearchBloc, DataGetterState<List<Television>>>(
            builder: (context, state) {
              return state.when(
                initial: () => const Expanded(
                  child: Center(
                    child: Text('Search for televisions'),
                  ),
                ),
                loadInProgress: () => const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
                loadSuccess: (televisions) {
                  if (televisions.isEmpty) {
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
                        final television = televisions[index];
                        return TelevisionCard(
                          id: television.id,
                          name: television.name,
                          overview: television.overview,
                          posterPath: television.posterPath,
                        );
                      },
                      itemCount: televisions.length,
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
