import 'package:my_movie_box/features/popular_movies/data/mapper/popular_movies_mapper.dart';
import 'package:my_movie_box/features/popular_movies/data/sources/remote/popular_movies_api_service.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';
import 'package:my_movie_box/features/popular_movies/domain/repository/movies_repository.dart';

class PopularMoviesRepositoryImpl extends PopularMoviesRepository {
  final PopularMoviesApiService _popularMoviesApiService;

  PopularMoviesRepositoryImpl(
      {required PopularMoviesApiService moviesApiService})
      : _popularMoviesApiService = moviesApiService;
  @override
  Future<List<Movie>> getPopularMovies(int page) async {
    final res = await _popularMoviesApiService.getPopularMovies(page);

    return PopularMoviesMapper.toPopularMoviesList(res.movies);
  }
}
