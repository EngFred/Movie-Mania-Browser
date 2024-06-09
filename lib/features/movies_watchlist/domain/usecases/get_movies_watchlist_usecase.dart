import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/repository/watchlist_movies_repository.dart';

class GetMoviesWatchlistUsecase
    extends StreamBaseUsecase<List<WatchlistMovie>, void> {
  final WatchlistMoviesRepository watchlistMoviesRepository;

  GetMoviesWatchlistUsecase({required this.watchlistMoviesRepository});

  @override
  Stream<List<WatchlistMovie>> call({void params}) {
    return watchlistMoviesRepository.findAllWatchlistMovies();
  }
}
