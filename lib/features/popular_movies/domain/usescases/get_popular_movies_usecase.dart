import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/popular_movies/domain/entities/movie.dart';
import 'package:my_movie_box/features/popular_movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUsecase extends Usecase<List<Movie>, int> {
  final PopularMoviesRepository _moviesRepository;

  GetPopularMoviesUsecase({required PopularMoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<List<Movie>> call({required int params}) async {
    final movies = await _moviesRepository.getPopularMovies(params);
    return movies;
  }
}
