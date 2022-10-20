import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/movie_detail.dart';
import '../bloc/movie_detail/movie_detail_bloc.dart';
import '../bloc/movie_detail/movie_detail_fetch_state.dart';
import '../bloc/movie_detail/recommendation_fetch_state.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({
    super.key,
    required this.id,
  });

  static const routeName = '/detail';

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<MovieDetailBloc>()
        ..add(MovieDetailEvent.movieDetailRequested(id))
        ..add(MovieDetailEvent.watchlistStatusRequested(id))
        ..add(MovieDetailEvent.recommendationRequested(id)),
      child: const Scaffold(
        body: _MovieDetailPageBody(),
      ),
    );
  }
}

class _MovieDetailPageBody extends StatelessWidget {
  const _MovieDetailPageBody();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieDetailBloc, MovieDetailState,
        MovieDetailFetchState>(
      selector: (state) => state.movieDetailFetchState,
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (movieDetail) => SafeArea(
            child: _DetailContent(movieDetail),
          ),
          loadFailure: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent(this.movieDetail);

  final MovieDetail movieDetail;

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += '${genre.name}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  String _showDuration(int runtime) {
    final int hours = runtime ~/ 60;
    final int minutes = runtime % 60;

    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else {
      return '${minutes}m';
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$baseImageUrl${movieDetail.posterPath}',
          width: screenWidth,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        Container(
          margin: const EdgeInsets.only(top: 48 + 8),
          child: DraggableScrollableSheet(
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: kRichBlack,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                ),
                padding: const EdgeInsets.only(
                  left: 16,
                  top: 16,
                  right: 16,
                ),
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        controller: scrollController,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movieDetail.title,
                              style: kHeading5,
                            ),
                            _WatchlistButton(movieDetail),
                            Text(
                              _showGenres(movieDetail.genres),
                            ),
                            Text(
                              _showDuration(movieDetail.runtime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: movieDetail.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text('${movieDetail.voteAverage}')
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              movieDetail.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            const _RecommendationList(),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        color: Colors.white,
                        height: 4,
                        width: 48,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: kRichBlack,
            foregroundColor: Colors.white,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _WatchlistButton extends StatelessWidget {
  const _WatchlistButton(this.movieDetail);

  final MovieDetail movieDetail;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieDetailBloc, MovieDetailState>(
      listenWhen: (previous, current) =>
          previous.watchlistActionState != current.watchlistActionState,
      listener: (context, state) {
        state.watchlistActionState.whenOrNull(
          actionSuccess: (message) =>
              ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(message)),
          ),
          actionFailure: (message) => showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Text(message),
                );
              }),
        );
      },
      buildWhen: (previous, current) =>
          previous.isAddedToWatchlist != current.isAddedToWatchlist,
      builder: (context, state) {
        return ElevatedButton(
          onPressed: () {
            if (state.isAddedToWatchlist) {
              context.read<MovieDetailBloc>().add(
                  MovieDetailEvent.removeFromWatchlistPressed(movieDetail));
            } else {
              context
                  .read<MovieDetailBloc>()
                  .add(MovieDetailEvent.addToWatchlistPressed(movieDetail));
            }

            context
                .read<MovieDetailBloc>()
                .add(MovieDetailEvent.watchlistStatusRequested(movieDetail.id));
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              state.isAddedToWatchlist
                  ? const Icon(Icons.check)
                  : const Icon(Icons.add),
              const Text('Watchlist'),
            ],
          ),
        );
      },
    );
  }
}

class _RecommendationList extends StatelessWidget {
  const _RecommendationList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<MovieDetailBloc, MovieDetailState,
        RecommendationFetchState>(
      selector: (state) => state.recommendationFetchState,
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (recommendationList) {
            return SizedBox(
              height: 150,
              child: recommendationList.isEmpty
                  ? const Center(child: Text('No Recommendation'))
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final movie = recommendationList[index];
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                MovieDetailPage.routeName,
                                arguments: movie.id,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: '$baseImageUrl${movie.posterPath}',
                                placeholder: (context, url) => const Center(
                                  child: CircularProgressIndicator(),
                                ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: recommendationList.length,
                    ),
            );
          },
          loadFailure: (message) => Center(
            child: Text(message),
          ),
          orElse: () => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
