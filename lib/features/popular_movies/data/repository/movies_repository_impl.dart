import 'package:my_movie_box/features/popular_movies/data/mapper/movie_mapper.dart';
import 'package:my_movie_box/features/popular_movies/data/sources/remote/movies_api_service.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';
import 'package:my_movie_box/features/popular_movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesApiService _moviesApiService;

  MoviesRepositoryImpl({required MoviesApiService moviesApiService})
      : _moviesApiService = moviesApiService;
  @override
  Future<List<Movie>> getPopularMovies() async {
    final res = await _moviesApiService.getPopularMovies();

    return MovieMapper.toMovieList(res.movies);
  }
}
