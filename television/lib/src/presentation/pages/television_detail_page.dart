import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../domain/entities/television_detail.dart';
import '../../domain/entities/television_season.dart';
import '../bloc/television_detail/television_detail_bloc.dart';
import '../bloc/television_detail/television_detail_fetch_state.dart';
import '../bloc/television_detail/tv_recommendation_fetch_state.dart';

class TelevisionDetailPage extends StatelessWidget {
  const TelevisionDetailPage({
    super.key,
    required this.id,
  });

  static const routeName = '/tv-detail';

  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<TelevisionDetailBloc>()
        ..add(TelevisionDetailEvent.televisionDetailRequested(id))
        ..add(TelevisionDetailEvent.watchlistStatusRequested(id))
        ..add(TelevisionDetailEvent.recommendationRequested(id)),
      child: const Scaffold(
        body: _TelevisionDetailPageBody(),
      ),
    );
  }
}

class _TelevisionDetailPageBody extends StatelessWidget {
  const _TelevisionDetailPageBody();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TelevisionDetailBloc, TelevisionDetailState,
        TelevisionDetailFetchState>(
      selector: (state) => state.televisionDetailFetchState,
      builder: (context, state) {
        return state.maybeWhen(
          loadSuccess: (televisionDetail) => SafeArea(
            child: _DetailContent(televisionDetail),
          ),
          loadFailure: (message) => Center(child: Text(message)),
          orElse: () => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent(this.televisionDetail);

  final TelevisionDetail televisionDetail;

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
    }

    return '${minutes}m';
  }

  String _showEpisodeRuntime(List<int> episodeRuntime) {
    String result = '';
    for (var runtime in episodeRuntime) {
      result += '${_showDuration(runtime)}, ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '$baseImageUrl${televisionDetail.posterPath}',
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
                              '${televisionDetail.name} (${televisionDetail.firstAirDate.substring(0, 4)})',
                              style: kHeading5,
                            ),
                            _WatchlistButton(televisionDetail),
                            Text(
                              _showGenres(televisionDetail.genres),
                            ),
                            Text(
                              _showEpisodeRuntime(
                                  televisionDetail.episodeRuntime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: televisionDetail.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text(televisionDetail.voteAverage
                                    .toStringAsFixed(1)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              televisionDetail.overview.isEmpty
                                  ? 'We don\'t have an overview translated in English.'
                                  : televisionDetail.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Seasons',
                              style: kHeading6,
                            ),
                            _SeasonList(televisionDetail.seasons),
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
  const _WatchlistButton(this.televisionDetail);

  final TelevisionDetail televisionDetail;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TelevisionDetailBloc, TelevisionDetailState>(
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
              context.read<TelevisionDetailBloc>().add(
                  TelevisionDetailEvent.removeFromWatchlistPressed(
                      televisionDetail));
            } else {
              context.read<TelevisionDetailBloc>().add(
                  TelevisionDetailEvent.addToWatchlistPressed(
                      televisionDetail));
            }

            context.read<TelevisionDetailBloc>().add(
                TelevisionDetailEvent.watchlistStatusRequested(
                    televisionDetail.id));
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

class _SeasonList extends StatelessWidget {
  const _SeasonList(this.seasons);

  final List<TelevisionSeason> seasons;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: seasons.length,
      itemBuilder: (context, index) => _SeasonListTile(seasons[index]),
    );
  }
}

class _SeasonListTile extends StatelessWidget {
  const _SeasonListTile(this.season);

  final TelevisionSeason season;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Card(
            child: Container(
              padding: const EdgeInsets.only(
                left: 16 + 80 + 16,
                bottom: 8,
                right: 8,
              ),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    season.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: kHeading6,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '${season.episodeCount} Episodes',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    season.airDate,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              left: 16,
              bottom: 16,
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              child: CachedNetworkImage(
                imageUrl: '$baseImageUrl${season.posterPath}',
                width: 80,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RecommendationList extends StatelessWidget {
  const _RecommendationList();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<TelevisionDetailBloc, TelevisionDetailState,
        TvRecommendationFetchState>(
      selector: (state) => state.tvRecommendationFetchState,
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
                        final television = recommendationList[index];
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                TelevisionDetailPage.routeName,
                                arguments: television.id,
                              );
                            },
                            child: ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: CachedNetworkImage(
                                imageUrl:
                                    '$baseImageUrl${television.posterPath}',
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
