import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/features/movie_details/presentation/screens/move_details_page.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';
import 'package:my_movie_box/features/movies/domain/models/movie_request_params.dart';
import 'package:my_movie_box/features/movies/presentation/pages/search_results_page.dart';
import 'package:my_movie_box/features/movies/presentation/provider/provider.dart';

class MoviesPage extends ConsumerStatefulWidget {
  const MoviesPage({super.key});

  @override
  ConsumerState<MoviesPage> createState() => _PopularMoviesPageState();
}

class _PopularMoviesPageState extends ConsumerState<MoviesPage> {
  final PagingController<int, Movie> _popularMoviesPagingController =
      PagingController(firstPageKey: 1);

  final Logger log = Logger();

  @override
  void initState() {
    super.initState();
    _popularMoviesPagingController.addPageRequestListener((pageKey) {
      _fetchPopularMoviesPage(pageKey);
    });
  }

  Future<void> _fetchPopularMoviesPage(int pageKey) async {
    final params = MoviesRequestParams(page: pageKey);
    try {
      final domainPopularMoviesRes =
          await ref.read(getPopularMoviesUsecaseProvider(params).future);
      final isLastPage = pageKey == domainPopularMoviesRes.totalPages!;
      if (isLastPage) {
        _popularMoviesPagingController
            .appendLastPage(domainPopularMoviesRes.movies);
      } else {
        final nextPageKey = pageKey + 1;
        _popularMoviesPagingController.appendPage(
            domainPopularMoviesRes.movies, nextPageKey);
      }
    } catch (error) {
      _popularMoviesPagingController.error = error;
      log.i("Paging error: $error");
    }
  }

  @override
  void dispose() {
    _popularMoviesPagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppSearchBar(),
      body: _buildPopularMoviesGrid(),
    );
  }

  Widget _buildPopularMoviesGrid() {
    return PagedGridView<int, Movie>(
      pagingController: _popularMoviesPagingController,
      builderDelegate: PagedChildBuilderDelegate<Movie>(
        itemBuilder: (context, movie, index) => _buildPopularMoviesCard(movie),
        firstPageErrorIndicatorBuilder: (context) => const Center(
          child: Text(
            'Error loading popular movies.',
            style: TextStyle(color: Colors.red),
          ),
        ),
        noItemsFoundIndicatorBuilder: (context) => const Center(
          child: Text('No popular movies found.'),
        ),
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.54,
      ),
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
                  errorWidget: (context, url, error) => const Center(
                    child: Icon(Icons.error),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 0,
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
                  child: _buildVoteAverageContainer(movie.voteAverage ?? 0),
                ),
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
                    movie.title ?? "-",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    movie.releaseDate != null && movie.releaseDate!.isNotEmpty
                        ? formatReleaseDate(movie.releaseDate!)
                        : "---",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
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

  void navigateToTheResultScreen(String query) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return SearchResultsPage(query);
    }));
  }

  PreferredSizeWidget _buildAppSearchBar() {
    return AppBarWithSearchSwitch(
      onChanged: (text) {},
      onSubmitted: (text) {
        if (text.isNotEmpty) {
          navigateToTheResultScreen(text);
        }
      },
      centerTitle: false,
      appBarBuilder: (context) {
        return AppBar(
          title: const Text(
            "My Movie Box",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          actions: [
            IconButton(
                onPressed: AppBarWithSearchSwitch.of(context)?.startSearch,
                icon: const Icon(
                  Icons.search,
                  size: 34,
                ))
          ],
        );
      },
    );
  }
}
