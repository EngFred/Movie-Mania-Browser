import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/repository/watchlist_movies_repository.dart';

class GetWatchlistMovieByIdUsecase
    extends StreamBaseUsecase<WatchlistMovie?, int> {
  final WatchlistMoviesRepository watchlistMoviesRepository;

  GetWatchlistMovieByIdUsecase({required this.watchlistMoviesRepository});

  @override
  Stream<WatchlistMovie?> call({int? params}) {
    return watchlistMoviesRepository.findWatchlistMovieById(params!);
  }
}
