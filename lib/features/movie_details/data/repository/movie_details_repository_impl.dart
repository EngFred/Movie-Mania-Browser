import 'package:my_movie_box/features/movie_details/data/mapper/movie_details_mapper.dart';
import 'package:my_movie_box/features/movie_details/data/sources/remote/movie_details_api_service.dart';
import 'package:my_movie_box/features/movie_details/domain/entities/movie_details.dart';
import 'package:my_movie_box/features/movie_details/domain/repository/move_details_repository.dart';

class MovieDetailsRepositoryImpl extends MovieDetailsRepository {
  final MovieDetailsApiService _movieDetailsApiService;

  MovieDetailsRepositoryImpl(
      {required MovieDetailsApiService movieDetailsApiService})
      : _movieDetailsApiService = movieDetailsApiService;

  @override
  Future<MovieDetails> getMovieDetails(int movieId) async {
    final response = await _movieDetailsApiService.getMovieDetails(movieId);
    return toMovieDetails(response);
  }
}
