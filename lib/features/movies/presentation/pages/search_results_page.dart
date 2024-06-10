import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/constants/constants.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/core/widgets/error_indicator.dart';
import 'package:my_movie_box/features/movie_details/presentation/screens/move_details_page.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';
import 'package:my_movie_box/features/movies/domain/models/movie_request_params.dart';
import 'package:my_movie_box/features/movies/presentation/provider/provider.dart';

class SearchResultsPage extends ConsumerStatefulWidget {
  final String searchQuery;
  const SearchResultsPage(this.searchQuery, {super.key});

  @override
  ConsumerState<SearchResultsPage> createState() => _SearchResultsPageState();
}

class _SearchResultsPageState extends ConsumerState<SearchResultsPage> {
  final log = Logger();
  final PagingController<int, Movie> _searchResultsPagingController =
      PagingController(firstPageKey: 1);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _searchResultsPagingController.addPageRequestListener((pageKey) {
      _fetchSearchedMoviesPage(pageKey);
    });
  }

  @override
  void dispose() {
    _searchResultsPagingController.dispose();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    bool isSmallPhone = screenWidth >= 320 && screenWidth < 500;
    bool isNormalPhone = screenWidth >= 500 && screenWidth < 640;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Search results: ${widget.searchQuery.trim()}",
            style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 18)),
      ),
      body: _buildSearchResultsListView(isSmallPhone, isNormalPhone),
    );
  }

  Widget _buildSearchResultsListView(bool isSmallPhone, bool isNormalPhone) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: PagedListView.separated(
        pagingController: _searchResultsPagingController,
        builderDelegate: PagedChildBuilderDelegate<Movie>(
          itemBuilder: (context, movie, index) =>
              _buildMovieCard(movie, isSmallPhone, isNormalPhone),
          firstPageErrorIndicatorBuilder: (context) =>
              ErrorIndicator(errMsg: errorMsg, onRetry: () {}),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text('No search results found.'),
          ),
        ),
        separatorBuilder: (context, index) =>
            const Divider(thickness: 1), // Add desired space between items
      ),
    );
  }

  Widget _buildMovieCard(Movie movie, bool isSmallPhone, bool isNormalPhone) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(isSmallPhone ? 10 : 30),
      child: Card(
        child: SizedBox(
          height: isSmallPhone ? 165 : 222,
          child: InkWell(
              onTap: () {
                showMovieDetail(movie.id);
              },
              child: Padding(
                padding: EdgeInsets.all(isSmallPhone ? 8 : 13),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.circular(isSmallPhone ? 8 : 15),
                      child: CachedNetworkImage(
                        width: isSmallPhone ? 123 : 175,
                        fit: BoxFit.cover,
                        imageUrl: getPosterUrl(movie.posterPath ?? ""),
                        errorWidget: (context, url, error) {
                          return const Center(
                            child: Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  movie.title ?? "-",
                                  maxLines: 2,
                                  overflow: TextOverflow.fade,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: isSmallPhone ? 16 : 18),
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              const Icon(Icons.more_vert)
                            ],
                          ),
                          Text(
                            getCountryName(movie.originalLanguage ?? "Unknown"),
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            movie.releaseDate != null &&
                                    movie.releaseDate!.isNotEmpty
                                ? formatReleaseDate(movie.releaseDate!)
                                : "---",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const Expanded(child: SizedBox()),
                          RatingBar.builder(
                            initialRating: movie.voteAverage != null &&
                                    movie.voteAverage != 0
                                ? movie.voteAverage! / 2
                                : 0,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: isSmallPhone ? 19 : 25,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (double value) {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  void showMovieDetail(int movieId) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return MovieDetailsPage(movieId: movieId);
    }));
  }

  Future<void> _fetchSearchedMoviesPage(int pageKey) async {
    final params = MoviesRequestParams(
        page: pageKey, query: widget.searchQuery.toLowerCase().trim());

    try {
      final searchResponse =
          await ref.read(searchMovieUsecaseProvider(params).future);
      final isLastPage = pageKey == searchResponse.totalPages!;
      if (isLastPage) {
        _searchResultsPagingController.appendLastPage(searchResponse.movies);
      } else {
        final nextPageKey = pageKey + 1;
        _searchResultsPagingController.appendPage(
            searchResponse.movies, nextPageKey);
      }
    } catch (error) {
      _searchResultsPagingController.error = error;
      log.i("Paging error: $error");
    }
  }
}
