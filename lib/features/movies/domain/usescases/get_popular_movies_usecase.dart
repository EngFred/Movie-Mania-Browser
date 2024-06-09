import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';
import 'package:my_movie_box/features/movies/domain/models/movie_request_params.dart';
import 'package:my_movie_box/features/movies/domain/repository/movies_repository.dart';

class GetPopularMoviesUsecase
    extends FutureBaseUsecase<DomainMoviesResponse, MoviesRequestParams> {
  final MoviesRepository _moviesRepository;

  GetPopularMoviesUsecase({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;

  @override
  Future<DomainMoviesResponse> call({MoviesRequestParams? params}) async {
    final movies = await _moviesRepository.getRemotePopularMovies(params!.page);
    return movies;
  }
}
