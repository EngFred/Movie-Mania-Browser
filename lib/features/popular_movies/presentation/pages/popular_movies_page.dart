import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/features/movie_details/presentation/screens/move_details_page.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';
import 'package:my_movie_box/features/popular_movies/presentation/provider/provider.dart';
import 'package:my_movie_box/core/widgets/error_indicator.dart';
import 'package:my_movie_box/core/widgets/loading_indicator.dart';

class PopularMoviesPage extends ConsumerStatefulWidget {
  const PopularMoviesPage({super.key});

  @override
  ConsumerState<PopularMoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends ConsumerState<PopularMoviesPage> {
  int page = 1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: ref.watch(getPopularMoviesProvider(page)).when(data: (movies) {
        Logger().i("First movie id: ${movies[0].id}"); //653346
        movies.shuffle(Random());
        return _buildPopularMoviesGrid(movies);
      }, error: (errMsg, stackTrace) {
        Logger().d("error: $errMsg");
        return ErrorIndicator(
          errMsg: "$errMsg",
          onRetry: () {
            ref.refresh(getPopularMoviesProvider(page)).isRefreshing;
          },
        );
      }, loading: () {
        return const LoadingIndicator();
      })),
    );
  }

  Widget _buildPopularMoviesGrid(List<Movie> movies) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.54),
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final Movie movie = movies[index];
            return _buildPopularMoviesCard(movie);
          }),
    );
  }

  Widget _buildPopularMoviesCard(Movie movie) {
    return InkWell(
      onTap: () {
        navigateToDetailScreen(movie.id);
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.379,
                  imageUrl: getPosterUrl(movie.posterPath ?? ""),
                  errorWidget: (context, url, error) {
                    return const Center(
                      child: Icon(Icons.error),
                    );
                  },
                ),
                Positioned(
                  top: 10, // Position from top
                  right: 0, // Position from right
                  child: IconButton(
                    color: Colors.transparent,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 0,
                    child: _buildVoteAverageContainer(movie.voteAverage ?? 0))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                left: 10,
                right: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    movie.title ?? "-",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      formatReleaseDate(movie.releaseDate ?? "-"))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildVoteAverageContainer(double voteAverage) {
    return CircleAvatar(
      radius: 25,
      child: Text(
          voteAverage != 0 ? convertVoteAverageToPercentage(voteAverage) : "-"),
    );
  }

  void navigateToDetailScreen(int movieId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MovieDetailsPage(movieId: movieId);
    }));
  }
}
