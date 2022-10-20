import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/television_watchlist.dart';
import '../bloc/watchlist_televisions/watchlist_televisions_bloc.dart';
import '../widgets/television_card.dart';

class WatchlistShowsPage extends StatelessWidget {
  const WatchlistShowsPage({super.key});

  static const routeName = '/watchlist-shows';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<WatchlistTelevisionsBloc>()
        ..add(DataGetterEvent.requested(NoParam())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TV Watchlist'),
        ),
        body: const _WatchlistShowsPageBody(),
      ),
    );
  }
}

class _WatchlistShowsPageBody extends StatefulWidget {
  const _WatchlistShowsPageBody();

  @override
  State<_WatchlistShowsPageBody> createState() =>
      __WatchlistShowsPageBodyState();
}

class __WatchlistShowsPageBodyState extends State<_WatchlistShowsPageBody>
    with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context
        .read<WatchlistTelevisionsBloc>()
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
      child: BlocBuilder<WatchlistTelevisionsBloc,
          DataGetterState<List<TelevisionWatchlist>>>(
        builder: (context, state) {
          return state.maybeWhen(
            loadSuccess: (televisions) {
              if (televisions.isEmpty) {
                return const Center(
                  child: Text('Empty Watchlist'),
                );
              }

              return ListView.builder(
                itemBuilder: (context, index) {
                  final televisionWatchlist = televisions[index];
                  return TelevisionCard(
                    id: televisionWatchlist.id,
                    name: televisionWatchlist.name,
                    overview: televisionWatchlist.overview,
                    posterPath: televisionWatchlist.posterPath,
                  );
                },
                itemCount: televisions.length,
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
