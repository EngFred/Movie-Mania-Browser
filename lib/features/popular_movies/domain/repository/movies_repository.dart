import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';

abstract class PopularMoviesRepository {
  //Future<Result<List<Movie>>> getPopularMovies();
  Future<List<Movie>> getPopularMovies(int page);
}
