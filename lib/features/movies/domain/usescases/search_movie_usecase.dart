import 'package:my_movie_box/core/usecase/usecase.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';
import 'package:my_movie_box/features/movies/domain/models/movie_request_params.dart';
import 'package:my_movie_box/features/movies/domain/repository/movies_repository.dart';

class SearchMovieUsecase
    extends FutureBaseUsecase<DomainMoviesResponse, MoviesRequestParams> {
  final MoviesRepository _moviesRepository;

  SearchMovieUsecase({required MoviesRepository moviesRepository})
      : _moviesRepository = moviesRepository;
  @override
  Future<DomainMoviesResponse> call({MoviesRequestParams? params}) async {
    return await _moviesRepository.searchMovie(params!.query!, params.page);
  }
}
