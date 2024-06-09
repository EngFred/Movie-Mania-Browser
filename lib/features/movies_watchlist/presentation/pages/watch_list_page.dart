import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/core/widgets/loading_indicator.dart';
import 'package:my_movie_box/features/movie_details/presentation/screens/move_details_page.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/presentation/providers/providers.dart';

class WatchListPage extends ConsumerStatefulWidget {
  const WatchListPage({super.key});

  @override
  ConsumerState<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends ConsumerState<WatchListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "My watchlist",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
        ),
        body: ref.watch(getMoviesWatchListProvider).when(data: (movies) {
          if (movies.isEmpty) {
            return const Center(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "No movies added to your watchlist yet!",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ));
          }
          return _buildWatchlistMoviesList(movies);
        }, error: (err, st) {
          return ErrorWidget(err);
        }, loading: () {
          return const LoadingIndicator();
        }));
  }

  Widget _buildWatchlistMoviesList(List<WatchlistMovie> movies) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: movies.length,
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return _buildWatchlistMovieCard(movie);
          }),
    );
  }

  Widget _buildWatchlistMovieCard(WatchlistMovie movie) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: InkWell(
        onTap: () => showMovieDetail(movie.id),
        child: Card(
          elevation: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 260,
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: getPosterUrl(movie.posterPath ?? ""),
                    errorWidget: (context, url, error) => const Center(
                      child: Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 260,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          combineTitleWithReleaseYear(
                              movie.title, movie.releaseDate),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          movie.tagline ?? "",
                          style: const TextStyle(
                              fontSize: 15, fontStyle: FontStyle.italic),
                        ),
                        const Expanded(child: SizedBox()),
                        OutlinedButton(
                          onPressed: () {
                            removeMovieFromWatchlist(movie.id);
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                                color: Colors.red), // Set border color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(8), // Set border radius
                            ),
                          ),
                          child: const Text(
                            "Remove",
                            style: TextStyle(color: Colors.red, fontSize: 17),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showMovieDetail(int movieId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MovieDetailsPage(movieId: movieId);
    }));
  }

  void removeMovieFromWatchlist(int movieId) async {
    try {
      await ref.read(deleteMovieFromWatchlistUsecaseProvider(movieId).future);
    } catch (e) {
      Logger().d("WOOOOOWE $e");
    }
  }
}
