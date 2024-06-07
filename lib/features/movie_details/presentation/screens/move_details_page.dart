import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/features/movie_details/presentation/provider/providers.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';
import 'package:my_movie_box/features/popular_movies/presentation/provider/provider.dart';

import '../../../../core/widgets/error_indicator.dart';
import '../../../../core/widgets/loading_indicator.dart';

class MovieDetailsPage extends ConsumerStatefulWidget {
  final int movieId;
  const MovieDetailsPage({super.key, required this.movieId});

  @override
  ConsumerState<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends ConsumerState<MovieDetailsPage> {
  int page = 23;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ref.watch(getMovieDetailsProvider(widget.movieId)).when(
            data: (movieDetails) {
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
                      child: IconButton(
                          onPressed: () {},
                          icon: const FaIcon(
                            FontAwesomeIcons.solidBookmark,
                            size: 30,
                            color: Colors.red,
                          ))),
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
                                imageUrl:
                                    getPosterUrl(movieDetails.posterPath ?? ""),
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
                                                  movieDetails.voteAverage != 0
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
                                          ? formatRuntime(movieDetails.runtime!)
                                          : "-",
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
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.start,
                    movieDetails.overview != null &&
                            movieDetails.overview!.isNotEmpty
                        ? movieDetails.overview!
                        : "Check also :",
                    style: TextStyle(
                        fontSize: movieDetails.overview != null &&
                                movieDetails.overview!.isNotEmpty
                            ? 16
                            : 18,
                        fontWeight: movieDetails.overview != null &&
                                movieDetails.overview!.isNotEmpty
                            ? FontWeight.normal
                            : FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: movieDetails.overview != null &&
                      movieDetails.overview!.isNotEmpty
                  ? 10
                  : 0,
            ),
            ref.watch(getPopularMoviesProvider(page)).when(data: (movies) {
              movies.shuffle();
              return _buildMoreMovies(movies);
            }, error: (err, trace) {
              return const SizedBox();
            }, loading: () {
              return const SizedBox();
            })
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
    }));
  }

  Widget _buildMoreMovies(List<Movie> movies) {
    return Container(
      height: 260,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: ListView.builder(
          itemCount: movies.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (contex, index) {
            final movie = movies[index];
            return movie.id != widget.movieId
                ? _buildMovieCard(movie)
                : const SizedBox();
          }),
    );
  }

  Widget _buildMovieCard(Movie movie) {
    return Card(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            showMovieDetail(movie.id);
          },
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            imageUrl: getPosterUrl(movie.posterPath ?? ""),
            errorWidget: (context, url, error) {
              return const Center(
                child: Icon(Icons.error),
              );
            },
          ),
        ),
      ),
    );
  }

  void showMovieDetail(int movieId) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return MovieDetailsPage(movieId: movieId);
    }));
  }
}
