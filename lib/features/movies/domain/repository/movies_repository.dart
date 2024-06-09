import 'package:my_movie_box/features/movies/domain/models/movie.dart';

abstract class MoviesRepository {
  //Future<Result<List<Movie>>> getPopularMovies();
  Future<DomainMoviesResponse> getRemotePopularMovies(int page);

  Future<DomainMoviesResponse> searchMovie(String query, int page);
}
