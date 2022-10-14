import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/state_enum.dart';
import '../../common/utils.dart';
import '../provider/television/watchlist_show_notifier.dart';
import '../widgets/television_card.dart';

class WatchlistShowsPage extends StatefulWidget {
  const WatchlistShowsPage({super.key});

  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/watchlist-shows';

  @override
  State<WatchlistShowsPage> createState() => _WatchlistShowsPageState();
}

class _WatchlistShowsPageState extends State<WatchlistShowsPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => context.read<WatchlistShowNotifier>().fetchTelevisionWatchlist(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    super.didPopNext();
    context.read<WatchlistShowNotifier>().fetchTelevisionWatchlist();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TV Watchlist'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Consumer<WatchlistShowNotifier>(
          builder: (context, notifier, child) {
            if (notifier.state == RequestState.Loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (notifier.state == RequestState.Loaded) {
              return ListView.builder(
                itemCount: notifier.televisionWatchlist.length,
                itemBuilder: (context, index) {
                  final televisionWatchlist =
                      notifier.televisionWatchlist[index];
                  return TelevisionCard(
                    id: televisionWatchlist.id,
                    name: televisionWatchlist.name,
                    overview: televisionWatchlist.overview,
                    posterPath: televisionWatchlist.posterPath,
                  );
                },
              );
            } else {
              return Center(
                key: const Key('error_message'),
                child: Text(notifier.message),
              );
            }
          },
        ),
      ),
    );
  }
}
