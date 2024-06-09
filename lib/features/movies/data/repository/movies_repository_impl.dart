import 'package:my_movie_box/features/movies/data/mapper/movies_mapper.dart';
import 'package:my_movie_box/features/movies/data/sources/remote/movies_api_service.dart';
import 'package:my_movie_box/features/movies/domain/models/movie.dart';
import 'package:my_movie_box/features/movies/domain/repository/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  final MoviesApiService _moviesApiService;

  MoviesRepositoryImpl({required MoviesApiService moviesApiService})
      : _moviesApiService = moviesApiService;
  @override
  Future<DomainMoviesResponse> getRemotePopularMovies(int page) async {
    final popularMoviesRes =
        await _moviesApiService.getRemotePopularMovies(page);

    return MoviesMapper.toDomainMoviesResponse(popularMoviesRes);
  }

  @override
  Future<DomainMoviesResponse> searchMovie(String query, int page) async {
    final apiResponse = await _moviesApiService.searchMovie(query, page);
    return MoviesMapper.toDomainMoviesResponse(apiResponse);
  }
}
