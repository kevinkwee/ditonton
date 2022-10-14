import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/state_enum.dart';
import '../../injection.dart' as di;
import '../provider/television/popular_shows_notifier.dart';
import '../widgets/television_card.dart';

class PopularShowsPage extends StatelessWidget {
  const PopularShowsPage({super.key});

  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/popular-shows';

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          di.locator<PopularShowsNotifier>()..fetchPopularShows(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Popular TV Shows'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8),
            child: Consumer<PopularShowsNotifier>(
              builder: (context, value, child) {
                final state = value.state;
                if (state == RequestState.Loading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state == RequestState.Loaded) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final television = value.televisionShows[index];
                      return TelevisionCard(
                        id: television.id,
                        name: television.name,
                        overview: television.overview,
                        posterPath: television.posterPath,
                      );
                    },
                    itemCount: value.televisionShows.length,
                  );
                } else {
                  return Center(
                    key: const Key('error_message'),
                    child: Text(value.message),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
