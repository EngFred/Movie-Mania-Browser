import 'package:floor/floor.dart';
import 'package:my_movie_box/features/movies_watchlist/data/entities/watchlist_movie_entity.dart';

@dao
abstract class WatchlistMovieDao {
  @Query('SELECT * FROM watchlist')
  Stream<List<WatchlistMovieEntity>> findAllWatchlistMovies();

  @Query('SELECT * FROM watchlist WHERE id = :id')
  Stream<WatchlistMovieEntity?> findWatchlistMovieById(int id);

  @Insert()
  Future<void> insertWatchlistMovie(WatchlistMovieEntity watchlistMovie);

  @Query('DELETE FROM watchlist WHERE id = :id')
  Future<void> deleteWatchlistMovieById(int id);
}
