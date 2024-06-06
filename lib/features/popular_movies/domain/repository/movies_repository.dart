import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';

abstract class MoviesRepository {
  //Future<Result<List<Movie>>> getPopularMovies();
  Future<List<Movie>> getPopularMovies();
}
