import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/television.dart';
import '../../injection.dart';
import '../bloc/data_getter/data_getter_bloc.dart';
import '../bloc/top_rated_television/top_rated_television_bloc.dart';
import '../widgets/television_card.dart';

class TopRatedShowsPage extends StatelessWidget {
  const TopRatedShowsPage({super.key});

  static const routeName = '/top-rated-shows';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TopRatedTelevisionBloc>()
        ..add(DataGetterEvent.requested(NoParam())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Rated TV Shows'),
        ),
        body: const _TopRatedShowsPageBody(),
      ),
    );
  }
}

class _TopRatedShowsPageBody extends StatelessWidget {
  const _TopRatedShowsPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<TopRatedTelevisionBloc,
          DataGetterState<List<Television>>>(
        builder: (context, state) {
          return state.maybeWhen(
            loadSuccess: (televisions) => ListView.builder(
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
