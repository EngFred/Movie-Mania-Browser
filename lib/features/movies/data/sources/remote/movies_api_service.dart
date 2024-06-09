import 'package:chopper/chopper.dart';
import 'package:my_movie_box/core/constants/constants.dart';
import 'package:my_movie_box/features/movies/data/models/remote_movies_response.dart';
import 'package:my_movie_box/features/movies/data/sources/remote/movies_api_response_converter.dart';

part 'movies_api_service.chopper.dart';

@ChopperApi()
abstract class MoviesApiService extends ChopperService {
  @Get(path: "movie/popular?api_key=$apiKey")
  Future<RemoteMoviesResponse> getRemotePopularMovies(@Query('page') int page);

  @Get(path: "search/movie?api_key=$apiKey")
  Future<RemoteMoviesResponse> searchMovie(
      @Query('query') String query, @Query('page') int page);

  static MoviesApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(baseUrl),
        interceptors: [HttpLoggingInterceptor()],
        services: [
          _$MoviesApiService(),
        ],
        converter: MoviesApiResponseConverter(),
        errorConverter: const JsonConverter());
    return _$MoviesApiService(client);
  }
}
