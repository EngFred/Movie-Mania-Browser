import 'package:logger/logger.dart';
import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/repository/watchlist_movies_repository.dart';

class AddMovieToWatchlistUsecase
    extends FutureBaseUsecase<void, WatchlistMovie> {
  final WatchlistMoviesRepository watchlistMoviesRepository;

  AddMovieToWatchlistUsecase({required this.watchlistMoviesRepository});

  @override
  Future<void> call({WatchlistMovie? params}) async {
    try {
      return await watchlistMoviesRepository.insertWatchlistMovie(params!);
    } catch (e) {
      Logger().d("Error in usecase $e");
    }
  }
}
