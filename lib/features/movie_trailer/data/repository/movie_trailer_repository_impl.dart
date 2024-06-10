import 'package:my_movie_box/features/movie_trailer/data/mapper/movie_trailer_response_mapper.dart';
import 'package:my_movie_box/features/movie_trailer/data/source/movie_trailer_api_service.dart';
import 'package:my_movie_box/features/movie_trailer/domain/models/movie_trailer_response.dart';
import 'package:my_movie_box/features/movie_trailer/domain/repository/movie_trailer_repository.dart';

class MovieTrailerRepositoryImpl extends MovieTrailerRepository {
  final MovieTailerApiService _movieTrailerApiService;

  MovieTrailerRepositoryImpl(
      {required MovieTailerApiService movieTrailerApiService})
      : _movieTrailerApiService = movieTrailerApiService;

  @override
  Future<List<Trailer>?> getMovieTrailer(int movieId) async {
    final trailers = await _movieTrailerApiService.getMovieTrailer(movieId);
    return trailers.trailers?.toTrailers();
  }
}
