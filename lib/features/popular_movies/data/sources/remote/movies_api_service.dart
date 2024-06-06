import 'package:chopper/chopper.dart';
import 'package:my_movie_box/core/constants/constants.dart';
import 'package:my_movie_box/features/popular_movies/data/models/api_response.dart';
import 'package:my_movie_box/features/popular_movies/data/sources/remote/api_response_converter.dart';

part 'movies_api_service.chopper.dart';

@ChopperApi()
abstract class MoviesApiService extends ChopperService {
  @Get(path: "movie/popular?api_key=$apiKey")
  Future<PopularMoviesApiResponse> getPopularMovies();

  static MoviesApiService create() {
    final client = ChopperClient(
        baseUrl: Uri.parse(baseUrl),
        interceptors: [HttpLoggingInterceptor()],
        services: [
          _$MoviesApiService(),
        ],
        converter: ApiResponseConverter(),
        errorConverter: const JsonConverter());
    return _$MoviesApiService(client);
  }
}
