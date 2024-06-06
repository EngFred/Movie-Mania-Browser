import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';
import 'package:my_movie_box/features/popular_movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUsecase extends Usecase<List<Movie>, void> {
  final MoviesRepository _moviesRepository;

  GetPopularMoviesUsecase({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<Movie>> call({void params}) async {
    final movies = await _moviesRepository.getPopularMovies();
    return movies;
  }
}
