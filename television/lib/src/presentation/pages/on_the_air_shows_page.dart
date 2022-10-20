import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/television.dart';
import '../bloc/on_the_air_television/on_the_air_television_bloc.dart';
import '../widgets/television_card.dart';

class OnTheAirShowsPage extends StatelessWidget {
  const OnTheAirShowsPage({super.key});

  static const routeName = '/ota-shows';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<OnTheAirTelevisionBloc>()
        ..add(DataGetterEvent.requested(NoParam())),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('On The Air TV Shows'),
        ),
        body: const _OnTheAirShowsPageBody(),
      ),
    );
  }
}

class _OnTheAirShowsPageBody extends StatelessWidget {
  const _OnTheAirShowsPageBody();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BlocBuilder<OnTheAirTelevisionBloc,
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
