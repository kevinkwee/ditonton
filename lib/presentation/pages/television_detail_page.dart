// ignore_for_file: use_build_context_synchronously

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import '../../common/constants.dart';
import '../../common/state_enum.dart';
import '../../domain/entities/genre.dart';
import '../../domain/entities/television.dart';
import '../../domain/entities/television_detail.dart';
import '../../domain/entities/television_season.dart';
import '../../injection.dart' as di;
import '../provider/television/show_detail_notifier.dart';

class TelevisionDetailPage extends StatelessWidget {
  const TelevisionDetailPage({super.key, required this.id});

  // ignore: constant_identifier_names
  static const ROUTE_NAME = '/tv-detail';

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => di.locator<ShowDetailNotifier>()
        ..fetchShowDetail(id)
        ..loadWatchlistStatus(id),
      builder: (context, child) {
        return Scaffold(
          body: Consumer<ShowDetailNotifier>(
            builder: (context, provider, child) {
              if (provider.state == RequestState.Loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (provider.state == RequestState.Loaded) {
                final television = provider.televisionDetail;
                return SafeArea(
                  child: _DetailContent(
                    television: television,
                    recommendations: provider.televisionRecommendations,
                    isAddedToWatchlist: provider.isAddedToWatchlist,
                  ),
                );
              } else {
                return Text(provider.message);
              }
            },
          ),
        );
      },
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    Key? key,
    required this.television,
    required this.recommendations,
    required this.isAddedToWatchlist,
  }) : super(key: key);

  final TelevisionDetail television;
  final List<Television> recommendations;
  final bool isAddedToWatchlist;

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
          imageUrl: '$BASE_IMAGE_URL${television.posterPath}',
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
                              '${television.name} (${television.firstAirDate.substring(0, 4)})',
                              style: kHeading5,
                            ),
                            ElevatedButton(
                              onPressed: () async {
                                if (!isAddedToWatchlist) {
                                  await context
                                      .read<ShowDetailNotifier>()
                                      .addWatchlist(television);
                                } else {
                                  await context
                                      .read<ShowDetailNotifier>()
                                      .removeWatchlist(television);
                                }

                                final message = context
                                    .read<ShowDetailNotifier>()
                                    .watchlistMessage;

                                if (message ==
                                        ShowDetailNotifier
                                            .watchlistAddSuccessMessage ||
                                    message ==
                                        ShowDetailNotifier
                                            .watchlistRemoveSuccessMessage) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(message)),
                                  );
                                } else {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        content: Text(message),
                                      );
                                    },
                                  );
                                }
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  isAddedToWatchlist
                                      ? const Icon(Icons.check)
                                      : const Icon(Icons.add),
                                  const Text('Watchlist'),
                                ],
                              ),
                            ),
                            Text(
                              _showGenres(television.genres),
                            ),
                            Text(
                              _showEpisodeRuntime(television.episodeRuntime),
                            ),
                            Row(
                              children: [
                                RatingBarIndicator(
                                  rating: television.voteAverage / 2,
                                  itemCount: 5,
                                  itemBuilder: (context, index) => const Icon(
                                    Icons.star,
                                    color: kMikadoYellow,
                                  ),
                                  itemSize: 24,
                                ),
                                Text(television.voteAverage.toStringAsFixed(1)),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Overview',
                              style: kHeading6,
                            ),
                            Text(
                              television.overview.isEmpty
                                  ? 'We don\'t have an overview translated in English.'
                                  : television.overview,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Seasons',
                              style: kHeading6,
                            ),
                            _SeasonList(television.seasons),
                            const SizedBox(height: 16),
                            Text(
                              'Recommendations',
                              style: kHeading6,
                            ),
                            _RecommendationList(recommendations),
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
                imageUrl: '$BASE_IMAGE_URL${season.posterPath}',
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
  const _RecommendationList(this.recommendations);

  final List<Television> recommendations;

  @override
  Widget build(BuildContext context) {
    return Consumer<ShowDetailNotifier>(
      builder: (context, provider, child) {
        if (provider.recommendationState == RequestState.Loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.recommendationState == RequestState.Error) {
          return Text(provider.message);
        } else if (provider.recommendationState == RequestState.Loaded) {
          return SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: provider.televisionRecommendations.length,
              itemBuilder: (context, index) {
                final television = recommendations[index];
                return Padding(
                  padding: const EdgeInsets.all(4),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        TelevisionDetailPage.ROUTE_NAME,
                        arguments: television.id,
                      );
                    },
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: CachedNetworkImage(
                        imageUrl: '$BASE_IMAGE_URL${television.posterPath}',
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
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
