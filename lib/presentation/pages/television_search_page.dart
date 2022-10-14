import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';
import '../../injection.dart' as di;
import '../provider/television/show_search_notifier.dart';
import '../widgets/television_card.dart';

class TelevisionSearchPage extends StatelessWidget {
  const TelevisionSearchPage({super.key});

  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/tv-search';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di.locator<ShowSearchNotifier>(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('TV Search'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: const InputDecoration(
                    hintText: 'Search title',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  textInputAction: TextInputAction.search,
                  onSubmitted: (query) {
                    context.read<ShowSearchNotifier>().fetchShowSearch(query);
                  },
                ),
                const SizedBox(height: 16),
                Text(
                  'Search Result',
                  style: kHeading6,
                ),
                Consumer<ShowSearchNotifier>(
                  builder: (context, value, child) {
                    if (value.state == RequestState.Loading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (value.state == RequestState.Loaded) {
                      final results = value.searchResults;
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemCount: results.length,
                          itemBuilder: (context, index) {
                            final television = value.searchResults[index];
                            return TelevisionCard(
                              id: television.id,
                              name: television.name,
                              overview: television.overview,
                              posterPath: television.posterPath,
                            );
                          },
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
