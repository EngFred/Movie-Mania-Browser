import 'package:logger/logger.dart';
import 'package:my_movie_box/features/movies_watchlist/data/dao/watchlist_movie_dao.dart';
import 'package:my_movie_box/features/movies_watchlist/data/mapper/watchlist_mapper.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/models/watchlist_movie.dart';
import 'package:my_movie_box/features/movies_watchlist/domain/repository/watchlist_movies_repository.dart';

class WatchlistMoviesRepositoryImpl extends WatchlistMoviesRepository {
  final WatchlistMovieDao dbDao;
  final Logger log = Logger();

  WatchlistMoviesRepositoryImpl({required this.dbDao});
  @override
  Future<void> deleteWatchlistMovie(int movieId) async {
    try {
      await dbDao.deleteWatchlistMovieById(movieId);
      log.d("Movie removed from the watchlist!");
    } catch (e) {
      log.i("Error removing movie from the watchlist $e!");
      throw Exception(e);
    }
  }

  @override
  Stream<List<WatchlistMovie>> findAllWatchlistMovies() {
    // try {
    //   // return entityMovies.map((movie) => movie.toModel()).toList();
    // } catch (e) {
    //   log.i("Error getting watchlist movies $e");
    //   throw Exception(e);
    // }
    try {
      return dbDao.findAllWatchlistMovies().map(
            (entityMovies) =>
                entityMovies.map((movie) => movie.toModel()).toList(),
          );
    } catch (e) {
      log.i("Error getting watchlist movies $e");
      throw Exception(e);
    }
  }

  @override
  Stream<WatchlistMovie?> findWatchlistMovieById(int id) {
    try {
      return dbDao.findWatchlistMovieById(id).map(
        (entityMovie) {
          if (entityMovie != null) {
            return entityMovie.toModel();
          } else {
            return null;
          }
        },
      );
    } catch (e) {
      log.i("Error fetching movie from watchlist $e!");
      throw Exception(e);
    }
  }

  @override
  Future<void> insertWatchlistMovie(WatchlistMovie watchlistMovie) async {
    try {
      await dbDao.insertWatchlistMovie(watchlistMovie.toEntity());
      log.d("Movie added to the watchlist!");
    } catch (e) {
      log.i("Error adding movie to watchlist button $e!");
      throw Exception(e);
    }
  }
}
