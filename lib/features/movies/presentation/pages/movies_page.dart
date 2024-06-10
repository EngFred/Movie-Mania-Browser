import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:logger/logger.dart';
import 'package:my_movie_box/core/utils/utils.dart';
import 'package:my_movie_box/core/widgets/error_indicator.dart';
import 'package:my_movie_box/features/movie_details/presentation/screens/move_details_page.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';
import 'package:my_movie_box/features/movies/domain/models/movie_request_params.dart';
import 'package:my_movie_box/features/movies/presentation/pages/search_results_page.dart';
import 'package:my_movie_box/features/movies/presentation/provider/provider.dart';

import '../../../../core/constants/constants.dart';

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
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    _popularMoviesPagingController.addPageRequestListener((pageKey) {
      _fetchPopularMoviesPage(pageKey);
    });
  }

  @override
  void didChangeDependencies() {
    double screenWidth = MediaQuery.of(context).size.width;
    Logger().f("Device width is: $screenWidth");
    super.didChangeDependencies();
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
    bool isSmallPhone = screenWidth >= 320 && screenWidth < 371;
    bool isNormalPhone = screenWidth >= 371 && screenWidth < 431;
    bool isBigPhone = screenWidth >= 431 && screenWidth < 502;
    // bool isSmallTablet = screenWidth >= 502 && screenWidth < 562;
    bool isTablet = screenWidth >= 500 && screenWidth < 640;
    return Scaffold(
        appBar: _buildAppSearchBar(),
        body: _buildPopularMoviesGrid(
            isSmallPhone, isNormalPhone, isBigPhone, isTablet));
  }

  Widget _buildPopularMoviesGrid(
      bool isSmallPhone, bool isNormalPhone, bool isBigPhone, bool isTablet) {
    return PagedGridView<int, Movie>(
      pagingController: _popularMoviesPagingController,
      builderDelegate: PagedChildBuilderDelegate<Movie>(
        itemBuilder: (context, movie, index) => _buildPopularMoviesCard(
            movie, isSmallPhone, isNormalPhone, isBigPhone, isTablet),
        firstPageErrorIndicatorBuilder: (context) =>
            ErrorIndicator(errMsg: errorMsg, onRetry: () {}),
        noItemsFoundIndicatorBuilder: (context) => const Center(
          child: Text('No popular movies found.'),
        ),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: isSmallPhone
              ? 0.51
              : isNormalPhone
                  ? 0.528
                  : isBigPhone
                      ? 0.545
                      : 0.585),
    );
  }

  Widget _buildPopularMoviesCard(Movie movie, bool isSmallPhone,
      bool isNormalPhone, bool isBigPhone, bool isTablet) {
    return InkWell(
      onTap: () {
        navigateToDetailScreen(movie.id);
      },
      child: Card(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                    width: double.infinity,
                    fit: BoxFit.cover,
                    imageUrl: getPosterUrl(movie.posterPath ?? ""),
                    progressIndicatorBuilder: (context, url, progress) {
                      return const Padding(
                        padding: EdgeInsets.only(top: 120),
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) => const Padding(
                      padding: EdgeInsets.only(top: 120),
                      child: Center(
                        child: Icon(Icons.error),
                      ),
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
                      maxLines: isSmallPhone ? 1 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 14),
                    ),
                    Text(
                      movie.releaseDate != null && movie.releaseDate!.isNotEmpty
                          ? formatReleaseDate(movie.releaseDate!)
                          : "---",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
