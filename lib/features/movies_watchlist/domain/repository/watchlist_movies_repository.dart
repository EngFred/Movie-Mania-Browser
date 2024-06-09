import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';

abstract class WatchlistMoviesRepository {
  Stream<List<WatchlistMovie>> findAllWatchlistMovies();

  Stream<WatchlistMovie?> findWatchlistMovieById(int id);

  Future<void> insertWatchlistMovie(WatchlistMovie watchlistMovie);

  Future<void> deleteWatchlistMovie(int movieId);
}
