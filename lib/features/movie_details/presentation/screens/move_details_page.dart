import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/features/movie_details/domain/models/movie_details.dart';
import 'package:my_movie_box/features/movie_details/presentation/provider/providers.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/presentation/providers/providers.dart';

import '../../../../core/widgets/error_indicator.dart';
import '../../../../core/widgets/loading_indicator.dart';

class MovieDetailsPage extends ConsumerStatefulWidget {
  final int movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  final Logger log = Logger();
  bool? isBookmarked;

  @override
  void initState() {
    super.initState();
    log.i("Movie id: ${widget.movieId}");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchMovieFromDatabase(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: ref.watch(getMovieDetailsProvider(widget.movieId)).when(
          data: (movieDetails) {
        bool castsAvailable = movieDetails.credits != null &&
            movieDetails.credits!.cast != null &&
            movieDetails.credits!.cast!.isNotEmpty;
        bool crewAvailable = movieDetails.credits != null &&
            movieDetails.credits!.crew != null &&
            movieDetails.credits!.crew!.isNotEmpty;

        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: getPosterUrl(movieDetails.backdropPath ?? ""),
                        errorWidget: (context, url, error) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.34,
                            color: const Color.fromARGB(255, 75, 75, 75),
                            padding: const EdgeInsets.only(top: 0),
                            child: const Center(
                              child: Icon(
                                Icons.error,
                                size: 50,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      right: 30,
                      top: 212,
                      child: InkWell(
                        onTap: () {},
                        child: CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.black.withOpacity(0.5),
                            child: const FaIcon(FontAwesomeIcons.play)),
                      ),
                    ),
                    Positioned(
                        right: 30,
                        top: 20,
                        child: isBookmarked != null
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    isBookmarked != null
                                        ? isBookmarked = !isBookmarked!
                                        : () {};
                                  });
                                  if (isBookmarked != null) {
                                    if (isBookmarked!) {
                                      addMovieToWatchlist(
                                          id: movieDetails.id,
                                          posterPath: movieDetails.posterPath,
                                          title: movieDetails.title,
                                          releaseDate: movieDetails.releaseDate,
                                          tagline: movieDetails.tagline);
                                    } else {
                                      removeMovieFromWatchlist(movieDetails.id);
                                    }
                                  }
                                },
                                icon: Icon(
                                  isBookmarked!
                                      ? Icons.bookmark
                                      : Icons.bookmark_outline,
                                  size: 35,
                                  color: Colors.green,
                                ))
                            : const SizedBox()),
                    Positioned(
                      bottom: 0,
                      left: 14,
                      right: 0,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.38,
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: getPosterUrl(
                                      movieDetails.posterPath ?? ""),
                                  errorWidget: (context, url, error) {
                                    return const Center(
                                      child: Icon(Icons.error),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 30, left: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textAlign: TextAlign.start,
                                    movieDetails.title ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(movieDetails.genres != null &&
                                          movieDetails.genres!.isNotEmpty
                                      ? movieDetails.genres!
                                          .map((genre) => genre.name)
                                          .join(" | ")
                                      : "-"),
                                  Row(
                                    children: [
                                      RatingBar.builder(
                                        initialRating:
                                            movieDetails.voteAverage != null &&
                                                    movieDetails.voteAverage !=
                                                        0
                                                ? movieDetails.voteAverage! / 2
                                                : 0,
                                        minRating: 1,
                                        direction: Axis.horizontal,
                                        allowHalfRating: true,
                                        itemCount: 5,
                                        itemSize: 25,
                                        itemBuilder: (context, _) => const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                        ),
                                        onRatingUpdate: (double value) {},
                                      ),
                                      const Text("   |   "),
                                      Text(
                                        movieDetails.runtime != null &&
                                                movieDetails.runtime != 0
                                            ? formatRuntime(
                                                movieDetails.runtime!)
                                            : "---",
                                        style: const TextStyle(fontSize: 15.5),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.start,
                      movieDetails.overview != null &&
                              movieDetails.overview!.isNotEmpty
                          ? movieDetails.overview!
                          : "---",
                      style: TextStyle(
                          fontSize: movieDetails.overview != null &&
                                  movieDetails.overview!.isNotEmpty
                              ? 16
                              : 18,
                          fontWeight: movieDetails.overview != null &&
                                  movieDetails.overview!.isNotEmpty
                              ? FontWeight.normal
                              : FontWeight.bold,
                          color: Colors.white60),
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 16, bottom: 10),
                    child: Text(
                      "Top Casts",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  castsAvailable
                      ? _buildCastsList(movieDetails.credits!.cast!)
                      : const SizedBox()
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, bottom: 10, top: 15),
                    child: Text(
                      crewAvailable ? "Crew" : "",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  crewAvailable
                      ? _buildCrewList(movieDetails.credits!.crew!)
                      : const SizedBox()
                ],
              )
            ],
          ),
        );
      }, error: (errMsg, stackTrace) {
        return ErrorIndicator(
          errMsg: "$errMsg",
          onRetry: () {
            ref.refresh(getMovieDetailsProvider(widget.movieId)).isRefreshing;
          },
        );
      }, loading: () {
        return const LoadingIndicator();
      }),
    ));
  }

  Widget _buildCastsList(List<Cast> casts) {
    return Container(
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final person = casts[index];
            return _buildCastCard(person);
          },
          itemCount: casts.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
        ));
  }

  Widget _buildCrewList(List<Crew> crew) {
    return Container(
        height: 300,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final person = crew[index];
            return _buildCrewCard(person);
          },
          itemCount: crew.length,
          separatorBuilder: (context, index) => const SizedBox(
            width: 8,
          ),
        ));
  }

  Widget _buildCastCard(Cast person) {
    return SizedBox(
      width: 190,
      child: Card(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 170,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: getPosterUrl(person.profilePath ?? ""),
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.name ?? "",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    Text(person.character ?? "",
                        maxLines: 1,
                        style: const TextStyle(fontSize: 14),
                        overflow: TextOverflow.clip),
                  ],
                ))
          ],
        ),
      )),
    );
  }

  Widget _buildCrewCard(Crew person) {
    return SizedBox(
      width: 190,
      child: Card(
          child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              height: 170,
              width: double.infinity,
              fit: BoxFit.fill,
              imageUrl: getPosterUrl(person.profilePath ?? ""),
              errorWidget: (context, url, error) {
                return const Center(
                  child: Icon(Icons.error),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      person.name ?? "",
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.fade,
                    ),
                    Text(
                      person.job ?? "",
                      maxLines: 1,
                      style: const TextStyle(fontSize: 14),
                      overflow: TextOverflow.clip,
                    ),
                  ],
                ))
          ],
        ),
      )),
    );
  }

  void showMovieDetail(int movieId) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return MovieDetailsPage(movieId: movieId);
    }));
  }

  void addMovieToWatchlist(
      {required int id,
      String? posterPath,
      String? title,
      String? releaseDate,
      String? tagline}) async {
    final movie = WatchlistMovie(
        id: id,
        posterPath: posterPath,
        title: title,
        releaseDate: releaseDate,
        tagline: tagline);
    await ref.read(addMovieToWatchlistUsecaseProvider(movie).future);
  }

  void removeMovieFromWatchlist(int movieId) async {
    await ref.read(deleteMovieFromWatchlistUsecaseProvider(movieId).future);
  }

  void fetchMovieFromDatabase(int movieId) async {
    Logger().d("Called!");
    final movie =
        await ref.watch(getWatchlistMovieByIdUsecaseProvider(movieId).future);

    if (movie == null) {
      setState(() {
        isBookmarked = false;
      });
    } else {
      setState(() {
        isBookmarked = true;
      });
    }

    Logger().d("DONE!");
  }
}
